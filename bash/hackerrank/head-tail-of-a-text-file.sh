#!/bin/bash

#Output the first 20 lines of the given text file.
head -n 20

#Output the first 20 characters of the text file.
head -c 20

#Display the lines (from line number 12 to 22, both inclusive) of a given text file.
head -n 22 | tail -n 11  #-->|
                         #    | --> tail show last 11 lines.... head -n B file.txt | tail -n $((B - A + 1))
head -n 22 | tail -n -11 #-->|

head -n 22 | tail -n +12 #--> tail from line 12 down to end

#Display the last 20 lines of an input file.
tail -n 20

#Output the last 20 characters of the text file.
tail -c 20
