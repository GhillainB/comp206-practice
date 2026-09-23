#!/bin/bash

# website: https://www.hackerrank.com/challenges/bash-tutorials---more-on-conditionals/problem?isFullScreen=true

read x
read y
read z

if [ $x -ge 1 ] && [ $y -ge 1 ] && [ $z -ge 1 ] &&
[ $x -le 1000 ] && [ $y -le 1000 ] && [ $z -le 1000 ] &&
[ $((x+y)) -gt $z ] && [ $((x+z)) -gt $y ] && [ $((y+z)) -gt $z ]; then
    
    if [ $x -eq $y ] && [ $y -eq $z ]; then
        echo "EQUILATERAL"
        
    elif [ $x -eq $y ] || [ $x -eq $z ] || [ $y -eq $z ]; then
        echo "ISOSCELES"
    
    else
        echo "SCALENE"
    
    fi

fi  

#Learned today
#--> Check Else doesnt have then

#Future work
#--> Reduce if loads
#--> Try put inputs in an array then loop using a For Loop
