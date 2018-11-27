/*
Program which takes n integers as input, and returns how many cases
in which the sum of three of the numbers is equal to another.
*/
#include <iostream> // input and output stream
#include <algorithm> // for sorting

using namespace std;

/*
NAIVE SOLUTION:
Given the task, you could simply just take every three numbers in the array, and see if there's some number inside the array 
that has the value of the sum. That is, though inefficient.


OPTIMAL SOLUTION:
We surely know that the sum of the first 3 smallest numbers is the smallest that could be. By removing the first term of
the sum and adding the next after the third, the resulting sum will grow, and so on. Basically, if we sort the array,
set an interval of numbers at the beginning, find their sum, check for numbers equal to that sum, if any, and just move 
the interval and do the same thing, we can find our answer faster.

*/

int main(){
    int n;
    cin >> n;
    if(n <= 3){
        cout << "Parameters don't correspond to the task." << endl;
        return 0;
    }
    int a[n];
    int sum = 0, left = 0, right = 0, counter = 0;
    for(int i = 0; i < n; i ++){
        cin >> a[i];
    }
    sort(a, a + n); // simple and efficient way to sort the array
    right = 2; // setting interval from which to take numbers to sort.
    sum = a[0] + a[1] + a[2]; // first sum.
    int index = 0; // the position of the array with which we compare the sum
    while(sum <= a[n-1]){
        
        //Setting the index at which to compare new sum, if changed
        while(sum > a[index]){
            index++;
        }

        //The obvious checking
        if(sum == a[index]){
            counter++;
        }

        // Shifting interval
        right ++;
        sum -= a[left];
        left ++;
        sum += a[right];
    }
    cout << counter << endl;
    return 0;
}