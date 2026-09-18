
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
#->Check tomorrow how to if (i%2) remainder is not 0 divisibility by 2 ✅✅
#->Check why there's a problem of syntax when using "-ne" not equal ✅✅
#-->Lots of problems with () or [] brackets ✅✅

#!/bin/bash
for ((i=1; i<100; i++)); do
    if [ $((i % 2)) -ne 0 ]; then
        echo "$i"
    fi
done

#Learned after completion:
#--> Initialization of variable; num=$1    *NO SPACE*
#--> Operations are done in DOUBLE brackets; difference=$((num2 - num1))
#--> If condition requires SPACE BEFORE, BETWEEN, and AFTER variables: if [ $num -gt 10 ]
#--> Other than initialization, SPACE before and after variable/sign IS IMPERATIVE
