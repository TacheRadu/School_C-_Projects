#include<iostream>
using namespace std;
int n = 6;
int *C1 = new int [1000];
int nc1;
int *C2 = new int [10000];
int nc2;
int Graf[100][100] = {{0, 1, 0, 1, 0, 0},
                      {1, 0, 1, 0, 1, 1},
                      {0, 1, 0, 1, 0, 0},
                      {1, 0, 1, 0, 0, 0},
                      {0, 1, 0, 0, 0, 1},
                      {0, 1, 0, 0, 1, 0}
                     };
int Grade[100];
int Visited[100];
int Stiva[100];
int init(){
    cout<<endl;
    for(int i = 0; i < 100; i++){
        Stiva[i] = -1;
    }
    for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            Grade[i] += Graf[j][i];
        }
    }
    return 0;
}
int refresh(){
    for(int i = 0; i < nc2; i++){
        C2[i] = 0;
        Visited[i] = 0;
    }
    nc2 = 0;
    return 0;
}
int top(int S[]){
    int a = 0;
    while(S[a] != -1){
        a++;
    }
    return a;
}
int push(int i){
    int a = top(Stiva);
    Stiva[a] = i;
    C2[a] = i;
    Grade[i]--;
    nc2++;
    return 0;
}
int pop(){
    Stiva[top(Stiva)-1] = -1;
    return 0;
}
int killAll(){
    while(top(Stiva)){
        pop();
    }
    return 0;
}
int insertion(int k){
    if(k < nc1){
        for(int i = 1; i < nc2; i++){
            C1[i+k+nc2-1] = C1[i+k];
        }
    }
    for(int i = 0; i < nc2; i++){
        C1[k+i] = C2[i];
        nc1++;
    }
    cout<<"C1: ";
    for(int i = 0; i < nc1-1; i++){
        cout<<C1[i]+1<<" ";
    }
    cout<<endl;
    cout<<"C2: ";
    for(int i = 0; i < nc2; i++){
        cout<<C2[i]+1<<" ";
    }
    cout<<endl;
    return 0;
}
int DFS(int node){
    push(node);
    Visited[node] = 1;
    int g;
    while(top(Stiva)){
        g = Stiva[top(Stiva)-1];
        for(int i = 0; i < n; i++){
            if(Graf[g][i] != 0 && Visited[i] != 1 && Grade[i]){
                Visited[i] = 1;
                push(i);
                Grade[i]--;
                if(Graf[i][node] == 1 && Stiva[1] != i){
                    push(node);
                    killAll();
                }
                break;
            }
            else if(i == n-1){
                pop();
            }
        }
    }
    return 0;
}
int euler(int i){
    DFS(i);
    insertion(i);
    refresh();
    for(int j = 0; j < nc1; j++){
        if(Grade[C1[j]] > 0){
            euler(C1[j]);
        }
    }
    return 0;
}
int main(){
    init();
    for(int i = 0; i < n; i++){
        cout<<Visited[i]<<" ";
    }
    cout<<endl;
    euler(0);
    cout<<endl;
}
