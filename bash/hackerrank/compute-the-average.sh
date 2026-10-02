#!/bin/bash

#Description: Given N integers, compute their average, rounded to three decimal places.
#The first line indicates that the number of integers whose average is to be computed.

read n
sum=0

for (( i=0; i<n; i++ )); do
    read num
    sum=$((sum + num))
done

printf "%.3f\n" $(echo "$sum / $n" | bc -l)

:'
4     <-- 1st call to `read n` grabs "4". Input cursor moves to line 2.
1     <-- 1st iteration of loop: `read num` grabs "1". Cursor moves to line 3.
2     <-- 2nd iteration of loop: `read num` grabs "2". Cursor moves to line 4.
9     <-- 3rd iteration of loop: `read num` grabs "9". Cursor moves to line 5.
8     <-- 4th iteration of loop: `read num` grabs "8". End of input reached.

'

#Lesson learned:
#read does not re-read from the top of the file/stream every time it runs. 
#It picks up exactly where the previous read left off until there are no lines left.
