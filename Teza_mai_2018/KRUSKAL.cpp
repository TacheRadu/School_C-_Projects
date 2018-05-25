#include <iostream>
#include <fstream>
#define infinit 999

using namespace std;
/*



8
1 2 4
1 6 2
2 6 5
2 3 6
3 6 1
3 4 3
4 5 2
5 6 4

*/

int n;
int M[100][100];
int V[100];

int read_data(){
ifstream f;
f.open("input5.txt");
f>>n;
for(int i=1;i<=n;i++)
        {f>>M[i][1];
        f>>M[i][2];
        f>>M[i][3];}
f.close();
for(int i=1;i<=n;i++)
    V[i]=i;
}

int my_swap(int a, int b){
    int A[100][3];

    A[1][1]=M[a][1];
    A[1][2]=M[a][2];
    A[1][3]=M[a][3];

    M[a][1]=M[b][1];
    M[a][2]=M[b][2];
    M[a][3]=M[b][3];

    M[b][1]=A[1][1];
    M[b][2]=A[1][2];
    M[b][3]=A[1][3];
}

int sort_data()
{
    int i, j, min_idx;
    for (i = 1; i <= n-1; i++)
    {
        min_idx = i;
        for (j = i+1; j <= n; j++)
          if (M[j][3] < M[min_idx][3])
            min_idx = j;
        my_swap(min_idx,i);
    }
}

int kruskal(){

V[1]=infinit;
for(int start=1;start<=(n);start++){
    if(V[M[start][1]]!=V[M[start][2]]){
        cout<<M[start][1]<<" "<<M[start][2]<<endl;
        int copie1=V[M[start][1]];
        int copie2=V[M[start][2]];
        for(int i=1;i<=n;i++){
                {if(V[i]==copie1)    V[i]=V[M[start][1]];
                if(V[i]==copie2)    V[i]=V[M[start][1]];}
        }
    }
}
}


int main(){

read_data();
sort_data();
kruskal();

}
