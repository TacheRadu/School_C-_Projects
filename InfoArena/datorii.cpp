#include <queue>
#include <vector>
#include <cstdio>

#define zeros(x) ( (x ^ (x - 1)) & x )

using namespace std;

unsigned int n, m, u, v;
vector<int> aib;
bool op;

int main(){
    queue<int> res;
    FILE *f;
    f = fopen("datorii.in", "r");
    fscanf(f, "%i %i", &n, &m);
    aib = vector<int>(n + 1);
    for(int i = 0; i < n; i++){
        int a;
        fscanf(f, "%i ", &a);
        for(int j = i + 1; j <= n; j += zeros(j)){
            aib[j] += a;
        }
    }
    for(int q = 0; q < m; q++){
        fscanf(f, "%i %i %i", &op, &u, &v);
        if(!op){
            for(int x = u; x <= n; x += zeros(x)){
                aib[x] -= v;
            }
        }
        else{
            int suma = 0;
            for(int k = v; k; k -= zeros(k)){
                suma += aib[k];
            }
            for(int k = u-1; k; k -= zeros(k)){
                suma -= aib[k];
            }
            res.push(suma);
        }
    }
    fclose(f);
    f = fopen("datorii.out", "w");
    while(res.size()){
        fprintf(f, "%i\n", res.front());
        res.pop();
    }
    fclose(f);
}
