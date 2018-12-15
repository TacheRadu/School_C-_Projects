#include <stack>
#include <utility>
#include <iostream>

using namespace std;

int main(){
    int n; 
    cin >> n;
    int a[n], p[n]; 
    for(int i = 0; i < n; i++){
        cin >> a[i];
        p[i] = 0;
    }
    for(int i = 0; i < n; i++){
        for(int j = 0; j < i; j++){
            if(a[i] > a[j]){
                p[i] = max(p[i], p[j] + 1);
            }
        }
    }
    int k = 0;
    for(int i = 0; i < n; i++){
        if(p[i] >= k){
            k = p[i] + 1;
        }
    }
    cout << k << endl;
    stack< pair<int, int> > top;
    int res[k];
    for(int i = 0; i < n-k+1; i++){
        res[0] = i;
        top.push(make_pair(i, i));
        while(top.size()){
            top.top().second++;
            if(a[top.top().first] < a[top.top().second]){
                res[top.size()] = top.top().second;
                top.push(make_pair(top.top().second, top.top().second));
            }
            if(top.size() == k){
                for(int i = 0; i < k; i++){
                    cout << a[res[i]] << " ";
                }
                cout << endl;
                top.pop();
            }
            if(top.top().second >= n-1){
                top.pop();
            }
        }
    }
}