#include <stdio.h>

void swap(int *pa, int *pb) {
    int temp = *pa;
    *pa = *pb;
    *pb = temp;
}

// In main:
swap(&x, &y);
// 



// This doesnt work the swap, it fails in main
// Swap does actually swap but since we didnt go deeper, we used int a as a copy of x
// The real x didnt change, that's why we need its address
#include <stdio.h>

void swap(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
    printf("Inside swap: a=%d, b=%d\n", a, b);
}

int main(void) {
    int x = 5, y = 10;
    swap(x, y);
    printf("Back in main: x=%d, y=%d\n", x, y);
}

Output:
Inside swap: a=10, b=5
Back in main: x=5, y=10
