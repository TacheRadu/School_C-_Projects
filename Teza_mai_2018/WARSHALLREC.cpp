#include<fstream>
#include <iostream>
using namespace std;

int n, M[100][100];

int min(int a, int b) {
    if(a < b) return a; else return b;
}

int read_data(){
    ifstream f;
    f.open("input.txt");
    f>>n;
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++)
            f>>M[i][j];
    f.close();
}

int show_data(){
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++)
            cout<<M[i][j]<<" ";
    cout<<endl;

    }


}
int changematrix() {
    for(int k = 1; k <= n; k++) {
        for(int i = 1; i <= n; i++) {
            if(i!=k){
                for(int j = 1; j <= n; j++) {
                    if(j != k) {
                        if(min(M[i][k], M[k][j]) && M[i][j] == 0) {
                            M[i][j] = 1;
                            changematrix();
                        }
                    }
                }
            }
        }
    }
}


int main() {
    read_data();
    changematrix();
    show_data();
}
