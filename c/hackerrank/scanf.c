#include <stdio.h>

char array[50];
int n=-1;
do { n++; array[n] = getc(stdin); } while(array[n] != ‘\n’)

//scanf in stdio.h
