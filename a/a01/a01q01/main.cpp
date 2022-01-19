#include <iostream>

using namespace std;

// user input string
string input;

string getkeywords(string input){
    string output = "";
    for(int i = 0; i < input.length(); i++){

        if(isdigit(input[i])){
            output += input[i];
        }

        else if(input[i] == '+' || input[i] == '+'){
            
        }

        else{
            cout << "ERROR: " << input[i] << " is neither a value nor found in the symtable";
            break;
        }
    }

    return output;
}


bool octalTest(string input){
    int num;
    string c =  string(1,input[0]);
    try{
        num = stoi(c);
    }

    catch(const std::exception& e){
        return false;
    }

    if(input.length() > 1 && num == 0){
        return true;
    }

    else{
        return false;
    }
}

int main(){

    string output; 

    while(true){

        // prompt & input
        cout << "\n>>>";
        cin >> input;

        output = getkeywords(input);
        
        if(octalTest(input) == true){
            cout << "ERROR: I don't understand octals yet";
        }

        else{
            cout << output;
        }

    }

    return 0;
}