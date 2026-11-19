#include <stdio.h>

int Fact(int n) {
    int results = 1;
    while (n > 1) {
        results *= n;
        n--;
    }
    return results;
}


// It avoids unnecessary n * (n-1)
