#!/bin/bash

#Given a text file, order the lines in lexicographical order.
sort

#Given a text file, order the lines in reverse lexicographical order (i.e. Z-A instead of A-Z).
sort -r

#Output the text file with the lines reordered in numerically ascending order.
sort -n

#The text file, with lines re-ordered in descending order (numerically).
sort -rn

#To sort the file by the second column in descending and numeric order (tab delimited)
sort -t $'\t' -k 2,2nr
sort -t $'\t' -k 2,2 -n -r
sort -t "$(echo -e '\t')" -k 2,2nr
# using k as field determiner [start] [end]
# using t as delimiter, bypassing access for \t

#Sort the data in ascending order of the 2nd column in tab delimited data
sort -t "$(echo -e '\t')" -k 2,2n

#Sort the data in descending order of the 2nd column in pipe delimited data
sort -t "|" -k 2,2nr
