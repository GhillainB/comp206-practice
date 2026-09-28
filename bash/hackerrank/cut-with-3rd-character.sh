#!/bin/bash
cut -c3 $1

# cut -f is only for words/fields as in f3-5
# -c is for character as in c3
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
