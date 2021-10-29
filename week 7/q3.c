#include <stdio.h>

#define ARRAY_LENGTH 10

int array[ARRAY_LENGTH] = {1, 2, 3, 4, 5, 6, 4, 3, 2, 1};

int max(int a[], int length);

int main(void) {
    int result = max(array, ARRAY_LENGTH);
    printf("%d\n", result);

    return 0;
}

int max(int a[], int length) {
    int first_element = a[0];
    if (length == 1) {
        return first_element;
    } else {
        // find max value in rest of array
        int max_so_far = max(&a[1], length - 1);
        if (first_element > max_so_far) {
            max_so_far = first_element;
        }
        return max_so_far;
    }
}
