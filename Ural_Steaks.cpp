#include <cmath>
#include <iostream>

using namespace std;

int n, k;

int main(){
    cin >> n >> k;
    if(! n % k){
        cout << n / k << endl;
        return 0;
    }
    cout << n / k + 2 << endl;
}