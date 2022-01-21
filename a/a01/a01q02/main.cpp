#include <iostream>
#include <cstring>
#include <vector>
#include <list>

using namespace std;

string symtable[5][2];

bool isInt(string x){
    string a = "";
    for(int i=0; i<x.length(); i++){
        if(isdigit(x[i])){
            a += x[i];
        }
    }

    try{
        isdigit(stoi(x));
        return true;
    }

    catch(exception& e){
        return false;
    }
}

bool isOct(string x){

    int num;
    string c =  string(1,x[0]);
    try{
        num = stoi(c);
    }

    catch(const std::exception& e){
        return false;
    }

    if(x.length() > 1 && num == 0){
        return true;
    }

    else{
        return false;
    }
}

bool checkSymtable(string var){
    for(int i=0; i<sizeof(symtable); i++){

        if(symtable[i][0] == var){
            return true;
        }
    }
    return false;
}

void evalExp(string exp){
    
    for(int i=0; i<exp.length();i++){
        if(exp[i] == '='){
            
        }
    }
}

int main(){
    string input;

    while(true){
        cout << "\n>>> ";
        cin >> input;

        if(isInt(input)){

            if(isOct(input)){
                cout << "ERROR: I don't understand octals yet";
            }
            else{
                for(int i=0; i<=input.length(); i++){
                    if(isdigit(input[i])){
                        cout << input[i];
                    }
                }
            }
        }

        else{

            if(checkSymtable(input)){

            }

            else{
                cout << "ERROR: " << input << " is neither a value nor found in the symtable";
            }
        }
    }

    return 0;
}