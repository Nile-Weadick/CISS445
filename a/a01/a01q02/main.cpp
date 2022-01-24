#include <iostream>
#include <cstring>
#include <string>
#include <vector>

using namespace std;

//global symtable
vector <string> symtable_name;
vector <string> symtable_value;


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

    for(int i=0; i<symtable_name.size(); i++){

        if(symtable_name[i] == var){
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

            for(int j = i+1; j<x.length(); j++){
                RHS += x[j];
                i = j;
            }
        }

        else{
            LHS += x[i];
        }
    }

    symtable_name.push_back(LHS);
    symtable_value.push_back(RHS);
}
//////////////////////////////////////////////////////
int main(){

    for( ; ; )
    {   
        string input;
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
                for(int i=0; i< symtable_name.size(); i++){
                    if(symtable_name[i] == input){
                        cout << symtable_value[i];
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