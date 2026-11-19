#include <stdio.h>

void swap(int *pa, int *pb) {
    int temp = *pa;
    *pa = *pb;
    *pb = temp;
}

// In main:
swap(&x, &y);
// 
