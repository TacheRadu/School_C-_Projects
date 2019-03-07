#include <vector>
#include <cstdio>
#include <fstream>

using namespace std;

int pow(int a, int b){
    a %= 10;
    if(!a){
        return 0;
    }
    if(b == 1){
        return a % 10;
    }
    else if(b == 2){
        return (a * a) % 10;
    }
    if(b % 2){
        return (a * pow(a * a, (b-1)/ 2)) % 10;
    }
    else{
        return (pow(a * a, b/2)) % 10;
    }
}
int main(){
    fstream f("cifra.in", fstream::in);
    FILE * g;
    g = fopen("cifra.out", "w");
    vector<int> sols(100, 0);
    for(int i = 1; i < 100; ++i){
        sols[i] = (sols[i - 1] + pow(i, i)) % 10;
    }
    int t, n;
    string s;
    f >> t;
    for(int q = 0; q < t; q++){
        f >> s;
        if(s.size() <= 2){
            n = stoi(s);
        }
        else{
            n = stoi(s.substr(s.size() - 2));
        }
        fprintf(g, "%i\n", sols[n]);
    }
}
