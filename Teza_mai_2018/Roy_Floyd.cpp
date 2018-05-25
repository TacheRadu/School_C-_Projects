/* E de pe net, nu stiu cat de bun e, dar aparent structura e asa cum a zis el
    Mie nu-mi recunoaste libraria conio.h( deci nu recunoaste getch-ul ) , vezi daca merge la tine.
*/
#include <iostream>
#include <conio.h>
using namespace std;
void floyds(int b[][7])
{
    int i, j, k;
    for (k = 0; k < 7; k++)
    {
        for (i = 0; i < 7; i++)
        {
            for (j = 0; j < 7; j++)
            {
                if ((b[i][k] * b[k][j] != 0) && (i != j))
                {
                    if ((b[i][k] + b[k][j] < b[i][j]) || (b[i][j] == 0))
                    {
                        b[i][j] = b[i][k] + b[k][j];
                    }
                }
            }
        }
    }
    for (i = 0; i < 7; i++)
    {
        cout<<"\ni = "<<i<<endl;
        for (j = 0; j < 7; j++)
        {
            cout<<b[i][j]<<"\t";
        }

    }
}
int main()
{
    int b[7][7];
    cout<<"Valori pentru matricea adiacenta :\n\n";
    for (int i = 0; i < 7; i++)
    {
        cout<<"Valori pentru linia "<<(i+1)<<endl;
        for (int j = 0; j < 7; j++)
        {
            cin>>b[i][j];
        }
    }
    floyds(b);
    getch();
}
