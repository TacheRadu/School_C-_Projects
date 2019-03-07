#include <bits/stdc++.h>

using namespace std;


const int N = 100010;
ifstream f("ramen.in");
ofstream g("ramen.out");

int n, d, i, pos, tim, res[N];
set< tuple<int, int, int> > people;
set< int > orders;

int main(){
    f >> n >> d;
    for(int i = 0; i < n; i++){
        f >> tim >> pos;
        people.insert(make_tuple(pos, tim, i));
        orders.insert(tim);
    }
    for(auto pers : people){
        tie(pos, tim, i) = pers;
        set<int>::iterator a = orders.lower_bound(tim - pos - d);
        res[i] = *a + d + pos;
        orders.erase(*a);
    }
    for(int i = 0; i < n; i++){
        g << res[i] << "\n";
    }
}
