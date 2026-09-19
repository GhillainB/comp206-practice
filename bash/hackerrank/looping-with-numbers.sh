#!/bin/bash

#Exercise: Looping with numbers
#https: https://www.hackerrank.com/challenges/bash-tutorials---looping-with-numbers/problem?isFullScreen=true
#Task : Use a for loop to display the natural numbers from 1 to 50.
#Input : None
#Output: 1, 2, 3, 4 ... 50

#Learned today:
#-> for use double brackets = for ((...;...;...))

for ((i=1; i<=50; i++)); do
    echo "$i"
done
