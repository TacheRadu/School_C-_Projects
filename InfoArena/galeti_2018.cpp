#include <fstream>

using namespace std;
ifstream f("galeti.in");
ofstream g("galeti.out");
int n;

void res(int st, int dr, long long e){
    if(e == dr - st){
        for(int i = st + 1; i <= dr; i++){
            g << i << " " << st << "\n";
        }
    }
    else if(e >= 2LL * (dr - st) - 1LL){
        res(st + 1, dr, e - (dr - st));
        g << st + 1 << " " << st << "\n";
    }
    else if(e > dr - st){
        res(dr - (e - (dr - st)), dr, e - dr + st);
        for(int i = st + 1; i <= dr - e + dr - st; i++){
            g << i << " " << st << "\n";
        }
    }
}

int main(){
    long long e;
    f >> n >> e;
    f.close();
    res(1, n, e);
}
