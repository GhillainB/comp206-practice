#!/bin/bash
#cut 2nd and 7th
cut -c 2,7

#cut from 2nd to 7th character
cut -c 2-7

#cut up to 4
cut -c -4

#cut with 3rd character
cut -c3 $1

# cut -f is only for words/fields as in f3
# -c is for character as in c3
# -c 2-5 --> edit characters from 2 to 5
# -c 1,3,5 --> extract 1st 3rd and 5th characters
# -c -4 --> edit from starting, count 4 positions
# -c 4- --> edit from the end
# -d "delimiter should be one char"

# Modifiers for READ
# read -p "P for Prompt"
# -d "delimiter should be one char"
# -n 3 --> Make read stop after 3 characters
# -N 3 --> Read only 3 characters, ignore others
# -r --> respects backlash
# IFS= read --> respects spaces, so no splitting "Hello World" into two lines

#####
# while read -r; do
#   echo "Processing: $REPLY"
# done < input.txt
######
## --> $REPLY reads in echo what line you just read
