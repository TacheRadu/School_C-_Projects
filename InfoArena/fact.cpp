#include <fstream>
#include <climits>

using namespace std;

unsigned int p;

unsigned int fct(unsigned int a){
    if(a < 5){
        return 0;
    }
    return a / 5 + fct(a / 5);
}

int main(){
    fstream f("fact.in", fstream::in);
    f >> p;
    f.close();
    unsigned long long a = 0, b = UINT_MAX;
    unsigned int c;
    while(a != b){
        c = (a + b + 1) / 2;
        if(fct(c) < p){
            a = c;
        }
        else{
            b = c - 1;
        }
    }
    a++;
    f.open("fact.out", fstream::out);
    if(fct(a) != p){
        f << -1;
        return 0;
    }
    f << a;
}
