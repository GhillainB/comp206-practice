#!/bin/bash

#Exercise: Personalized echo
#https:https://www.hackerrank.com/challenges/bash-tutorials---a-personalized-echo/problem?isFullScreen=true
#Task: Write a Bash script which accepts  as input and displays the greeting "Welcome (name)"
#Input: name
#Output: Welcome "name"

#Learned today: 
# The sign $ doesn't require brackets () or " ", everything in immediate approximity are processed
# read only requires variable name "x" or "y", the valuable will immediately be initialized hence $x = value

#Next:
#->Check if the sign $ can process a longer command not just proximity e.g $(date +%Y-%m--%dT%H:%M:%S) in
# tar -czf backups/homework-$(date +%Y-%m-%dT%H:%M:%S).tar.gz  ~/comp-206/homework
# since in shell no bracket is needed
# say --> echo "Welcome $(name number)" or $name $number

read name
echo "Welcome $name"
