#include <iostream>

using namespace std;

// user input string
string input;


int main(){

    string output;

    while(true){

        // prompt & input
        cout << "\n>>>";
        cin >> input;

        // convert input string to char array
        char p[input.length()];
        for(int i = 0; i <sizeof(input); i++){
            p[i] = input[i];
        }

        for(int i = 0; i < sizeof(p); i++){

            if(!isdigit(p[i])){
                cout << "ERROR: " << input << " is neither a value nor found in the symtable";
                break;
            }

            else if(p[0] == 0){
                cout << "ERROR: I don't understand octals yet";
                break;
            }

            else{
                output += p[i];
            }
            
        }

        cout << output;
        output = "";

    }

    return 0;
}