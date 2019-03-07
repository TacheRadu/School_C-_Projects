#include <map>
#include <queue>
#include <vector>
#include <fstream>
#include <algorithm>

using namespace std;

bool cmp(const vector<int> &a, const vector<int> &b){
    if(a[0] == b[0]){
        return a[1] < b[1];
    }
    return a[0] < b[0];
}

map<int, unsigned long long> res;
map<int, bool> is_Confirmed;
queue<int> comenzi;
vector< vector<int> > scaun;

int main(){
    fstream f("ramen.in", fstream::in);
    int n, d;
    f >> n >> d;
    scaun = vector< vector<int> >(n, vector<int>(2));
    for(int i = 0; i < n; i++){
        int a, b;
        f >> a >> b;
        scaun[i][0] = b;
        scaun[i][1] = a;
        comenzi.push(a + d);
    }
    sort(scaun.begin(), scaun.end(), cmp);
    while(comenzi.size()){
        for(auto i : scaun){
            if((i[0] + comenzi.front() >= i[1]) && (!is_Confirmed[i[1]])){
                res[i[1]] = comenzi.front() + i[0];
                is_Confirmed[i[1]] = 1;
                comenzi.pop();
            }
        }
    }
    f.close();
    f.open("ramen.out", fstream::out);
    for(auto i : res){
        f << i.second << endl;
    }
}