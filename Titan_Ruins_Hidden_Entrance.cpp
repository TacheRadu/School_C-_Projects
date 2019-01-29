#include <vector>
#include <iostream>

using namespace std;

int n;

int main(){
    cin >> n;
    vector<int> sections(n);
    for(int i = 0; i < n; i++){
        cin >> sections[i];
    }
    if(n == 3){
        cout << sections[0] + sections[1] + sections[2] << " " << 2 << endl;
        return 0;
    }
    int s, smax = 0, imax = 0;
    s = sections[0] + sections[1] + sections[2];
    smax = s; 
    imax = 1;
    for(int i = 3; i < n; i++){
        s -= sections[i - 3];
        s += sections[i];
        if(smax < s){
            smax = s;
            imax = i;
        }
    }
    cout << smax << " " << imax << endl;
}