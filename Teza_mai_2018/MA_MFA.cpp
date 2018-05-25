#include <iostream>
#include <fstream>
using namespace std;

int n;
int A[100][100];
int B[100][100];

int read_data(){
    ifstream f;
    f.open("input.txt");
    f>>n;
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++)
            f>>A[i][j];
    f.close();
}

int print_data(){
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++)
            cout<<B[i][j]<<" ";
        cout<<endl;
    }
}

int MA_MFA(){
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++){
            if(A[i][j]==1){
                    B[i][j]=1;
                    B[j][i]=1;
            }
        }
}
int main(){
read_data();
MA_MFA();
print_data();
}
