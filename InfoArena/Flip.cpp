#include <vector>
#include <fstream>

using namespace std;

int n, m;

int main(){
    fstream f("flip.in", fstream::in);
    f >> n >> m;
    vector<vector<int>> t(n, vector<int>(m));
    for(auto i = t.begin(); i != t.end(); ++i){
        for(auto j = (*i).begin(); j != (*i).end(); ++j){
            f >> *j;
        }
    }
    f.close();
    for(int i = 0; i < n; i++){
        int sum = 0;
        for(int j = 0; j < m; j++){
            sum += t[i][j];
        }
        if(sum < 0){
            for(int j = 0; j < m; j++){
                t[i][j] *= -1;
            }
        }
    }
    for(int i = 0; i < m; i++){
        int sum = 0;
        for(int j = 0; j < n; j++){
            sum += t[j][i];
        }
        if(sum < 0){
            for(int j = 0; j < n; j++){
                t[j][i] *= -1;
            }
        }
    }
    long long res = 0;
    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            res += t[i][j];
        }
    }
    f.open("flip.out", fstream::out);
    f << res;
    f.close();
}
