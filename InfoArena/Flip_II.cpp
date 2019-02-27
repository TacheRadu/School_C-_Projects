#include <map>
#include <stack>
#include <vector>
#include <fstream>

using namespace std;

int n;
vector<int> p;
vector<int> ttu;
map<int, bool> beenThrough;

void setTTUs(){
    stack<int> inCycle;
    for(int i = 0; i < n; i++){
        if(ttu[i] != 1){
            continue;
        }
        int pows = 1;
        int j = i;
        inCycle.push(i);
        while(p[j] != i){
            j = p[j];
            pows++;
            inCycle.push(j);
        }
        while(inCycle.size()){
            ttu[inCycle.top()] = pows;
            inCycle.pop();
        }
    }
}

int gcd(int a, int b){
    int r;
    while(a % b){
        r = a % b;
        a = b;
        b = r;
    }
    return b;
}

int main(){
    fstream f("perm2.in", fstream::in);
    f >> n;
    p = vector<int>(n);
    ttu = vector<int>(n, 1);
    for(int i = 0; i < n; i++){
        f >> p[i];
        p[i]--;
    }
    setTTUs();
    int lcm = 1;
    for(int i = 0; i < n; i++){
        if(!beenThrough[ttu[i]]){
            lcm = (ttu[i] * lcm) / gcd(lcm, ttu[i]);
            beenThrough[ttu[i]] = 1;
        }
    }
    f.close();
    f.open("perm2.out", fstream::out);
    f << lcm << endl;
}