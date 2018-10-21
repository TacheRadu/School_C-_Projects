#include<iostream>
using namespace std;
int main(){
    int n, m;
    cin >> m >> n;
    if (((n - 1) * m) % 2){
        cout << "[second]=:]";
        return 0;
    }
    cout << "[:=[first]";
}