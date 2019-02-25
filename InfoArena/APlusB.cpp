#include<fstream>

using namespace std;

int a, b;
int main(){
    fstream in("adunare.in", fstream::in);
    in >> a >> b;
    in.close();
    in.open("adunare.out", fstream::out);
    in << a + b;
    in.close();
}
