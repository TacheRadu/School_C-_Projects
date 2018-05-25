#include <iostream>
#include <fstream>
#define infinit 999
using namespace std;

int M[100][100];
int n;
int S[100];
int D[100];
int start;
int nod;
struct elemente{
    int nevizitate;
    int precedent;
}elementele[100];

int read_data(){
    ifstream f;
    f.open("input2.txt");
    f>>n;
    for(int i=1;i<=n;i++)
        for(int j=1;j<=n;j++)
            f>>M[i][j];
    f.close();
    return 0;
}

int gata(){
    for(int i=1;i<=n;i++)
        if(S[i]==0) return 1;
    return 0;

}

int dijkstra(){

    nod=1;
    int x=gata();
    S[nod]=1;
    for(int i=1;i<=n;i++)
        elementele[i].nevizitate=999;
    elementele[nod].nevizitate=0;
    cout<<"Nod    "<<"Valoare drum minim"<<"      "<<"Precedenti"<<endl;
    cout<<nod<<"                 "<<elementele[nod].nevizitate<<endl;
    while(x){
        int minim=999;
        for(int i=1;i<=n;i++)
                if(M[nod][i]!=999)
                    if(elementele[i].nevizitate>M[nod][i]+elementele[nod].nevizitate){
                        elementele[i].nevizitate=M[nod][i]+elementele[nod].nevizitate;
                        elementele[i].precedent=nod ;
                    }
        int da=1;
        for(int i=1;i<=n;i++)
            if(S[i]==0){
               /* if(nevizitate[i]==minim || minim>nevizitate[i] )
                    {nod=i;da=0;}
            S[i]=1;cout<<i<<" "<<nevizitate[i]<<endl;
            }
            */
            if(minim>elementele[i].nevizitate)minim=elementele[i].nevizitate;
            }
        for(int i=1;i<=n;i++)
        if(S[i]==0 && da==1){
            if(elementele[i].nevizitate==minim){
                nod=i;da=0;S[i]=1;cout<<i<<"                 "<<elementele[i].nevizitate<<"                 ";
                int y;
                y=elementele[i].precedent;
                while(y){
                    cout<<y<<" ";
                    y=elementele[y].precedent;

                }
        cout<<endl;
            }


        }
    x=gata();
    }



}


int main(){

    read_data();
    dijkstra();

}
/*


DG ponderate
G(X,U), e f U-R in functie de cost in funct de cost
Reprez: matrice a costurilor in int caruia
M[i][j]= 0 daca i=j
	 costul d(xi,xj) daca exista arcul
	 sau +infinit daca nu exista arc de la i la j
Roy Floyd determina lungimile drumurilor prin
trans succesive in matricea costurilor ( asem Roy Warshal )

Pt oricare k=1 pana la n
	opt i=1 pana la u
		pt j=1 pana la n
			M[i][j]=min(M[i][j],M[i][k]+M[k][j])

algoritmul lui Dijsktra det drumului de lung
min de la un vf de start x0 la toate celelalte
oricare ar fi xi xj apartinant X xj!=x0

date si struct de date necesare
n, numarul de noduri
M, matricea costurilor
S, vector carac al varfurilor rezolvate
S[i]= 1 i varf rezolvat
      0 i varf nerezolvat
vectorul solutie unde d[i]=k drumul de lungime minima
xio la xi este k
initial D preia linia xi0 din matricea costurilor
am memorate lungimi minime ale unor drumuri
catre rezolvata dar si catre nerezolvata
dijkstra ruleaza in n-1 pasi
la un pas oarecare k
1) aleg din nerezolvate un varf pentru a il rezolva
aleg cautand un varf nerezolvat pt care
in D
nod;
minim=999
pt i=1 la n  daca s[i]=0 atunci daca
	dijsktra
initializari
pt i de la 1 la n-1{
	aleg nodul de rezolvatD[i]<minim[minim=D[i],nod=minim;]
2. S[nod]=1;
   actualizez vectorul solutie in locatiile
vf nerezolvate pt ca este posibil ca prin vf tocmai nou rezolvat
sa existe un drum mai scurt aw sa  parcurg toate nerezolvatele si atunci ma intreb daca prin nodul taman rezolvat exista un drum mai scurt daca ceea ce memeoram in d pe locul nerezolvatului acesta pe care am calcat
aici aici memomram infinit mai mare decat drumul de lungime minima V[nod] + M[nod][i];

-> Dijsktra

int M[100][100];
int n;
int S[100];
int D[100];
int start;


int read_data()
int dijkstra()
int printdata()

int main(){
read_data();
dijsktra();
print_data();
unde  ( parcurgere cu un scop de a gasi un minim )
	marchez nodul ca rezolvatS[nod]=1;
	studiez in D vect soutie


}
}

inputs:
6
0 7 9 999 999 14
999 0 10 15 999 999
999 999 0 11 999 2
999 999 999 0 6 999
999 999 999 999 0 999
999 999 999 999 9 0


5
0 1 1 999 999
999 0 999 1 1
999 999 0 999 999
999 999 999 0 999
999 999 999 999 0


*/
