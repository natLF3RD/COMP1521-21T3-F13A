#include <stdio.h>

// 3 main things for a recursive function
    // have an end condition.
    // call self (recursion).
    // change some variable in some way so that we reach the end condition.
void print_recursively(int nums[], int i) {
    // this will be a way of reaching the end.
    if (i >= 10 || i < 0)
        return; 

    printf("%d\n", nums[i]);
    
    // // change some variable in some way so that we reach the end condition.
    i++;
    
    // call self (recursion).
    print_recursively(nums, i++);
}

int main(int argc, char* argv[])
{
    // int nums[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    // for (int i = 0; i < 10; i++) {
    //     printf("%d\n", nums[i]);
    // }
    
    printf("\n");
    
    int i = 0;
    printf("i= %d\n", i);
    
    int a = i++;
    printf("a= %d\n", a);
    printf("i= %d\n", i);
    int b = ++i;
    printf("b= %d\n", b);
    
    // print_recursively(nums, 0);
    return 0;
}

