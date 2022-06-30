#include <iostream>
#include <cstring>
#include <algorithm>
using namespace std;

const int N=510,M=10010;

int dist[N],backup[N];//backup[]是备份数组，防止更新距离时发生串联效应
int n,m,k;//k表示最多经过k条边得到最小距离

struct Edge{
    int a,b,w;//a代表边的起点，b代表边的终点，w代表边的权重
}edges[M];

void bellman_ford()
{
    memset(dist,0x3f,sizeof dist);
    dist[1]=0;

    for(int i=0;i<k;i++)
    {
        memcpy(backup,dist,sizeof dist);//每次更新距离前备份数组，防止串联
        for(int j=0;j<m;j++)
        {
            int a=edges[j].a;
            int b=edges[j].b;
            int w=edges[j].w;

            dist[b]=min(dist[b],backup[a]+w);//更新距离时用上一次的结果进行更新
        }
    }
}

int main()
{
    cin>>n>>m>>k;

    for(int i=0;i<m;i++)
    {
        int a,b,w;
        cin>>a>>b>>w;
        edges[i]={a,b,w};
    }

    bellman_ford();

    if(dist[n]>0x3f3f3f3f/2)
    {
        puts("impossible");
    }
    else
    {
        cout<<dist[n]<<endl;
    }
}