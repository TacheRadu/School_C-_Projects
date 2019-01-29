#include <stack>
#include <cmath>
#include <iomanip>
#include <iostream>

using namespace std;

unsigned long long num;
stack <unsigned long long > mystack;

int main(){
    while(cin >> num){
        mystack.push(num);
    }
    cout << fixed << setprecision(4);
    while(mystack.size()){
        cout << double(sqrt(mystack.top())) << endl;
        mystack.pop();
    }
    return 0;
}
