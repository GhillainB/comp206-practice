#include <stdio.h>
#include <string.h>


int searchString(char text[], char word[], int start) {
    while (text[start] != '\0') {
        int i = 0;

        while (word[i] != '\0' && text[start + i] == word[i]) {
            i++;
        }

        if (word[i] == '\0') {
            return start;
        }

        start++;
    }

    return -1;
}

// Text is the string or sentence
// Word is the word to be searched
