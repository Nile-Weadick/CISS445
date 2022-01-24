#include <iostream>
#include <cstring>
#include <string>

using namespace std;

//global symtable
string symtable[5][2];


/////////////////////////////////////////////////////

bool findEqual(string x){

    for(int i=0; i<x.length(); i++){

        if(x[i] == '='){
            return true;
        }
    }

    return false;
}

/////////////////////////////////////////////////////////////////////
bool isInt(string x){

    for(int i=0; i<x.length(); i++){

        if(isalpha(x[i]) || x[i] == '='){
            return false;
            break;
        }
    }

    return true;
}
////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////
bool isOct(string x){

    if(x.length() > 1 && x[0] == '0'){
        return true;
    }
    else{
        return false;
    }
}
/////////////////////////////////////////////////////
bool checkSymtable(string var){
    for(int i=0; i<sizeof(symtable); i++){

        if(symtable[i][0] == var){
            return true;
        }
    }
    return false;
}
///////////////////////////////////////////////////////
void insertVarToSym(string x){

    string LHS, RHS;

    for(int i=0; i<x.length(); i++){

        if(x[i] == '='){

            for(int j = i+1; j<x.length(); i++){
                RHS += x[j];
            }
        }

        else{
            LHS += x[i];
        }
    }


    for(int i=0; i<sizeof(symtable); i++){

        if(symtable[i][0] == " "){

            symtable[i][0] = LHS;
            symtable[i][1] = RHS;
        }
    }
}
//////////////////////////////////////////////////////
int main(){

    string input;
    for( ; ; )
    {
        cout << "\n>>> ";
        cin >> input;
        ///////////////////////////////////////
        if(isInt(input)){
            if(isOct(input)){
                cout << "ERROR: Octal";
            }
            ////////////////////////////
            else{
                cout << evalInt(input);
            }
        }

        ///////////////////////////////////////////////////////
        else{

            if(checkSymtable(input)){
                for(int i=0; i< sizeof(symtable); i++){
                    if(symtable[i][0] == input){
                        cout << symtable[i][1];
                    }
                }
            }
            ////////////////////////////////////////
            else{
                cout << "ERROR: " << input << " is neither a value nor found in the symtable";
            }
        }
    }
    
    return 0;
}