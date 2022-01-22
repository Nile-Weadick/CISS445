#include <iostream>
#include <cstring>
#include <vector>
#include <list>

using namespace std;

string symtable[5][2];
/*

--123
123
-+-123
123

int multiplyer = 1;
multip * -1;
*/

string evalInt(string x){

    int mult =1;
    string a = "";

    for(int i=0; i<x.length();i++){
        if(x[i] == '-'){
            mult *= -1;
        }
        else if(x[i] == '+'){
            mult *= 1;
        }

        else if(isdigit(x[i])){
            a += x[i];
        }
    }

    return to_string(stoi(a)*mult);
}

bool isInt(string x){

    string a = "";
    for(int i=0; i<x.length();i++){
        if(isdigit(x[i])){
            a += x[i];
        }
    }
    try{
        isdigit(stoi(a));
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

bool checkEqual(string x){

    for(int i=0; i<x.length();i++){
        if(x[i] == '='){
            return true;
        }
    }

    return false;
}

void evalExp(string exp){
    string lhs,rhs;

    for(int i=0; i<exp.length();i++){
        if(exp[i] == '='){
            
            for(int j=i+1; j<exp.length(); j++){
                rhs += exp[j];
            }
        }

        else{
            lhs += exp[i];
        }
    }

    for(int i=0; i<sizeof(symtable); i++){

        if(symtable[i][0] == " "){

            symtable[i][0] = lhs;
            symtable[i][1] = rhs;
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
                        
                    }
                }

                cout << evalInt(input);
            }
        }

        else{

            if(checkSymtable(input)){
                
                for(int i=0; i< sizeof(symtable); i++){
                    if(symtable[i][0] == input){
                        cout << symtable[i][1];
                    }
                }

            }

            else{
                cout << "ERROR: " << input << " is neither a value nor found in the symtable";
            }
        }
    }

    return 0;
}