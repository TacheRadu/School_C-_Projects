#include<iostream>
#include<fstream>
using namespace std;

int n;
int A[100][100];
int counter;

struct LL{
int numar;
int adiacenti[100];


}L[100];


int read_data(){
ifstream f;
f.open("input.txt");
f>>n;
for(int i=1;i<=n;i++)
    for(int j=1;j<=n;j++)
        f>>A[i][j];
f.close();
}


int show_data(){
for(int i=1;i<=n;i++){
    cout<<L[i].numar<<"                   ";
    for(int j=1;j<=L[i].numar;j++){
        cout<<L[i].adiacenti[j]<<" ";
    }
    cout<<endl;


}

}

int L_L(){
for(int i=1;i<=n;i++){
    counter=0;
    for(int j=1;j<=n;j++){
            if(A[i][j]==1){
                counter++;
                L[i].adiacenti[counter]=j;
            }

    }
    L[i].numar=counter;
}

}


int main(){
    read_data();
    L_L();
    show_data();

}
