#include<fstream>

using namespace std;

int a, b;

int main(){
    fstream f("cmmdc.in", fstream::in);
    f >> a >> b;
    int r;
    while(a % b != 0){
        r = a % b;
        a = b;
        b = r;
    }
    if(b == 1){
        b = 0;
    }
    f.close();
    f.open("cmmdc.out", fstream::out);
    f << b;
    f.close();
}
