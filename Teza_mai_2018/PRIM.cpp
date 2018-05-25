#include <iostream>
#include <fstream>
#define nimic 1000
#define infinit 999
using namespace std;

/*


6 8
1 6 2
1 2 4
2 6 3
2 3 6
3 6 1
3 4 3
4 5 2
5 6 4

*/

int n,m;
int M[100][100];
int cheie[100];
int tata[100];
int vizitat[100];
int G[100][100];
int read_data(){
ifstream f;
f.open("input5.txt");
f>>n;
f>>m;
for(int i=1;i<=m;i++){
    f>>M[i][1];
    f>>M[i][2];
    f>>M[i][3];
}
for(int i=1;i<=n;i++){
    cheie[i]=infinit;
    tata[i]=nimic;
}
for(int i=1;i<=n;i++)
    vizitat[i]=0;
}

int gata(){
for(int i=1;i<=n;i++)
    if(vizitat[i]==0) return 1;
return 0;
}

int graf(){
for(int i=1;i<=m;i++){
    G[M[i][1]][M[i][2]]=1;
    G[M[i][2]][M[i][1]]=1;
}

}

int gasit(int x,int y){

    for(int i=1;i<=m;i++){
        if(x==M[i][1] && y==M[i][2]) return i;
    }
}

int prim(){
cheie[1]=0;
while(gata()){
    int minim[100];
    minim[1]=infinit;
    for(int i=1;i<=n;i++){
        if(minim[1]>cheie[i] && vizitat[i]==0){
            minim[1]=cheie[i];
            minim[2]=i;
        }
    }
    vizitat[minim[2]]=1;
    cout<<minim[2]<<" ";

    for(int i=1;i<=n;i++){
        int urmatorul,urmatorul1;
        if(minim[2]<i) {urmatorul=minim[2];urmatorul1=i;} else {urmatorul=i;urmatorul1=minim[2];}
        int x=gasit(urmatorul,urmatorul1);

        if(G[minim[2]][i]==1){

            if(vizitat[i]==0 && M[x][3]<cheie[i]){
                tata[i]=minim[2];
                cheie[i]=M[x][3];
            }
    }
    }


}


}

int main(){
read_data();
graf();
prim();



}
