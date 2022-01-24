#include <iostream>
#include <cstring>
#include <string>

using namespace std;

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
                cout << "ERROR: " << input << " is neither a value nor found in the symtable";
        }
    }
    
    return 0;
}