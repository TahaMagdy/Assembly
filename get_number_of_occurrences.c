#include<stdio.h>

/*
* Counts the number of occurrences of a specific number in an array.
*/
int
count_occurrences(int number, int *array, int size){

int i = 0; 
int occurrences = 0;

while(i < size + 1)
    {
        if(array[i] == number)
            occurrences++;
        i++;
    } // end while

return occurrences;
} // end count_occurrences()




int
main(void)
{

int array[15] =  {1,2,5,4,5,2,3,4,5,5,5,5,6,4,1};
printf("%d\n", count_occurrences(5, array, 15));


return 0;
} // end main

