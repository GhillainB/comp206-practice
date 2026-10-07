#!/bin/bash

#Given a text file, remove the consecutive repetitions of any line.
uniq

#Given a text file, count the number of times each line repeats itself. Only consider consecutive repetitions
uniq -c
#remove trailing space in front of it
uniq -c | tr -s ' ' | cut -c 2-

# This time, case insensitive manner
uniq -c -i | tr -s ' ' | cut -c 2-

#Given a text file, display only those lines which are not followed or preceded by identical replications.
uniq -u  #--> reverse unique
