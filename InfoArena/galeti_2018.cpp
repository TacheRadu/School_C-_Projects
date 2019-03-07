#include <fstream>

using namespace std;

fstream f, g;
int n;

void res(int st, int dr, long long e){
    if(e == dr - st){
        for(int i = st + 1; i <= dr; i++){
            g << i << " " << st << endl;
        }
    }
    else if(e >= 2LL * (dr - st) - 1LL){
        res(st + 1, dr, e - (dr - st));
        g << st + 1 << " " << st << endl;
    }
    else if(e > dr - st){
        res(dr - (e - (dr - st)), dr, e - dr + st);
        for(int i = st + 1; i <= dr - e + dr - st; i++){
            g << i << " " << st << endl;
        }
    }
}

int main(){
    long long e;
    f.open("galeti.in", fstream::in);
    g.open("galeti.out", fstream::out);
    f >> n >> e;
    f.close();
    res(1, n, e);
}