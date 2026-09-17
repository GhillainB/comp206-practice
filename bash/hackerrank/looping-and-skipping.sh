
#!/bin/bash

#Exercise: Looping and Skipping
#https://www.hackerrank.com/challenges/bash-tutorials---looping-and-skipping/problem?isFullScreen=true
#Task: for loops to display only odd natural numbers from 1 to 99
#Input: none
#Output: 1 3 5 7 ... 99

#Learned today: 
# Bash needs lots of spacing
#-echo"i" will print i and not the value of i as in "$i"

#Next:
#->Check tomorrow how to if (i%2) remainder is not 0 divisibility by 2
#->Check why there's a problem of syntax when using "-ne" not equal
#-->Lots of problems with () or [] brackets

for ((i=1; i<100; i+=2)); do
    echo "$i"
done

