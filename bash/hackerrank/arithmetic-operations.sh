#!/bin/bash

read x
echo "scale=5; val=$x; if (val >= 0) val += 0.0005 else val -= 0.0005; scale=3; val/1" | bc -l

#I can redo it in a simpler way and help both negative and positive value
#I didnt realise I succeeded in +0.0005 positive numbers while the negative operations needed -.0005
#So I was closer to answer by helping the negatives too
#Check on the if statement
