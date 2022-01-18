#include <iostream>

using namespace std;
string input;

int main(){

    while(true){
        cout << "\n>>>"; 
        cin >> input;

        if(!isdigit(input)){
            cout << "\"" << input << "\"" << "is neither a value nor found in the symtable";
        }
        else{
            cout << input;
        }
    }

    return 0;
}