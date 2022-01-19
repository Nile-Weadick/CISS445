#include <iostream>
#include <cstring>

using namespace std;

// user input string
string input;


class Stack {
private:
    char st[50];
    int top;
 
public:
    Stack()
    {
        top = 0;
    }
 
    // push funct
    void push(char var)
    {
        st[++top] = var;
    }
 
    // pop funct
    char pop()
    {
        return st[top--];
    }
 
    // gettop funct
    int gettop()
    {
        return top;
    }
};
 
class Express {
private:
    // Stack object
    Stack s;
 
    char* pStr;
    int len;
 
public:
    Express(char* ptr)
    {
        pStr = ptr;
        len = strlen(pStr);
    }
 
    // Parse the input string
    void parse();
 
    // Evaluate the stack
    int solve();
};
 
void Express::parse()
{
 
    // Character from the input string
    char ch;
 
    // Last value
    char lastval;
 
    // Last operator
    char lastop;
 
    // For each input character
    for (int j = 0; j < len; j++) {
        ch = pStr[j];
 
        // If it's a digit then save
        // the numerical value
        if (ch >= '0' && ch <= '9')
            s.push(ch - '0');
 
        // If it's an operator
        else if (ch == '+') {
 
            // If it is the first operator
            // then put it in the stack
            if (s.gettop() == 1)
 
                s.push(ch);
 
            // Not the first operator
            else {
                lastval = s.pop();
                lastop = s.pop();
 
                // If it is either '*' or '/' and the
                // last operator was either '+' or '-'
                if ((ch == '*' || ch == '/')
                    && (lastop == '+' || lastop == '-')) {
 
                    // Restore the last two pops
                    s.push(lastop);
                    s.push(lastval);
                }
 
                // In all the other cases
                else {
 
                    // Perform the last operation
                    switch (lastop) {
 
                    // Push the result in the stack
                    case '+':
                        s.push(s.pop() + lastval);
                        break;
                    default:
                        cout << "\nUnknown oper";
                        exit(1);
                    }
                }
                s.push(ch);
            }
        }
        else {
            cout << "\nUnknown input character";
            exit(1);
        }
    }
}
 
int Express::solve()
{
    // Remove the items from stack
    char lastval;
    while (s.gettop() > 1) {
        lastval = s.pop();
        switch (s.pop()) {
 
        // Perform operation, push answer
        case '+':
            s.push(s.pop() + lastval);
            break;
               case '-':
            s.push(s.pop() - lastval);
            break;
        case '*':
            s.push(s.pop() * lastval);
            break;
        case '/':
            s.push(s.pop() / lastval);
            break;
        default:
            cout << "\nUnknown operator";
            exit(1);
        }
    }
    return int(s.pop());
}
 

int main(){

    while(true){

        cout << "\n>>>";
        cin >> input;

        // convert input string to char array
        char p[input.length()];
        for(int i = 0; i <sizeof(input); i++){
            p[i] = input[i];
        }

        // Make expression
        Express* eptr = new Express(p);

        // Parse it
        eptr->parse();

        // Solve the expression
        cout << eptr->solve();
    }

    return 0;
}