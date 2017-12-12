#include <stdio.h>
int number_of_occurance(float num,float list[]);


int
main(void) {

    // Getting the size of the array.
    int size = 0;
    printf("Enter the size of the array: ");
    scanf("%d",&size);

    // Creating the array
    float array[size]; 


    // Populating the array
    int i;
    printf("Enter your elements : \n");
    for (i = 0; i < size; i++)
        scanf("%f", &array[i]);


    // Getting the number 
    float num;
    printf("Enter the number [to get # occurrences]: ");
    scanf("%f",&num);


    // Computing the occurrences of `num`
    int numberOfOccurance = number_of_occurance(num, array);
    printf("number %.2f occurs (%d) time(s) :  \n", num, numberOfOccurance);

    return 0;
} // end main


int number_of_occurance(float num,float list[])
{
    int i=0, count=0;
    while (i<15)
    {
        if(list[i]==num)
            count=count+1;
        i++;
    }
    return count;

}
