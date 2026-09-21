#!/bin/bash

#Exercise: The World of Numbers
#https:https://www.hackerrank.com/challenges/bash-tutorials---the-world-of-numbers/problem?isFullScreen=true
#Task: Given two integers, X and Y, find their sum, difference, product, and quotient (only the integer part).
#Condition: -100<=x,y<=100
#Input: 5 2
#Output: 7 3 10 2 (Vertically)

#Learned today: 
# if statement can only take one condition at a time
# The switch condition is doesnt use "switch"... it's more complicated
# echo has to have $sum... the dollar sign $
# Maintain spaces in if-then-fi statement
# You can use && (and) as well as || (or) and maintain space

#Arithmetic operations should have double brackets and no space as in assigning value
#--> sum=$((x+y))

#Next:
#->Use a switch condition to go through multiple conditions at once

read x
read y
if [ $x -ge -100 ] && 
    [ $x -le 100 ] && 
    [ $y -ge -100 ] && 
    [ $y -le 100 ] && 
    [ $y -ne 0 ]; then
    
    sum=$((x+y))
    difference=$((x-y))
    product=$((x*y))
    quotient=$((x/y))
    echo "$sum"
    echo "$difference"
    echo "$product"
    echo "$quotient"
fi

#Learned after completion:
#--> Initialization of variable; num=$1    *NO SPACE*
#--> Operations are done in DOUBLE brackets; difference=$((num2 - num1))
#--> If condition requires SPACE BEFORE, BETWEEN, and AFTER variables: if [ $num -gt 10 ]
#--> Other than initialization, SPACE before and after variable/sign IS IMPERATIVE
