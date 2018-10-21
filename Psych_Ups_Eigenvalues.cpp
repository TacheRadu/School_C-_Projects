#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;

vector<int> eigen1;
vector<int> eigen2;
vector<int> eigen3;
int findInThird(int value){
    for(int i = 0; i < eigen3.size(); i++){
        if(eigen3[i] == value){
            return 1;
        }
    }
    return 0;
}
int findInSecond(int value){
    for(int i = 0; i < eigen2.size(); i++){
        if(eigen2[i] == value){
            return findInThird(value);
        }
    }
    return 0;
}
int main(){
    int n1, n2, n3;
    int val;
    cin >> n1;
    for(int i = 0; i < n1; i++){
        cin >> val;
        eigen1.push_back(val);
    }
    cin >> n2;
    for(int i = 0; i < n2; i++){
        cin >> val;
        eigen2.push_back(val);
    }
    cin >> n3;
    for(int i = 0; i < n3; i++){
        cin >> val;
        eigen3.push_back(val);
    }
    sort(eigen1.begin(), eigen1.end());
    sort(eigen2.begin(), eigen2.end());
    sort(eigen3.begin(), eigen3.end());
    val = 0;
    for(int i = 0; i < eigen1.size(); i++){
        if(findInSecond(eigen1[i])){
            val++;
        }
    }
    cout << val;
}