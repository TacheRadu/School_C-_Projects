#include<iostream>
#include<stdio.h>
using namespace std;
int n;
int *Graf;
int *Visited;
int read_Data(){
	FILE * f;
	f = fopen("input.dat", "r");
	fscanf(f, "%i", &n);
	Graf = new int[n*n];
	Visited = new int[n];
	for(int i = 0; i < n; i++){
		Visited[i] = 0;
		for(int j = 0; j < n; j++){
			fscanf(f, "%i", &Graf[n*i + j]);
		}
	}
	return 0;
}
int DFS(int i){
	cout<<i+1<<" ";
	Visited[i] = 1;
	for(int j = 0; j < n; j++){
		if(Graf[n*i + j] && !Visited[j]){
			DFS(j);
		}
	}
	return 0;
}
int main(){
	read_Data();
	DFS(0);
	cout<<endl;
	return 0;
}