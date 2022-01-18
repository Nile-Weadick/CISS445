#include <iostream>

using namespace std;
string input;


int main(){

    while(true){
        cout << "\n>>>";
        cin >> input;

            char p[input.length()];
            for(int i = 0; i <sizeof(input); i++){
            p[i] = input[i];
            }


            int num = (int) p[0];
            if(num == 0){
                cout << " no ocatlas";
            }


        try{

            stoi(input);
            cout << input;
        }

        catch (const exception& e){
            cout << "ERROR: " <<"'" << input << "'" << " is neither a value nor found in the symtable";
        }
    }

    return 0;
}