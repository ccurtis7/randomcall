#!/usr/bin/env bash

# Takes a CSV file of student names (as current formatted by the
# University of Washington) and outputs the first name of a random
# student.

NAME=${1?Error: no name given}

input=$NAME
a=($(wc $input))
lines=${a[0]}
#RANDOM=$$
DIV=$lines
DIV=`expr $DIV - 1` #Ensures that we don't print the first line of the csv file.
R=$(($RANDOM%$DIV))
R=`expr $R + 2` #Ensures that we don't print the first line of the csv file.
#R=$( printf '%1d' $R )
counter=1

# while IFS=',' read -r a b c d e f g;
# do
#   if [ $R = $counter ]
#     then
#       echo "$d"
#     else
#       if [ $counter -ge $R ]
#           then
#             break
#       fi
#   fi
#   counter=`expr $counter + 1`
# done < "$input"

sed -n "$R p" $input > 'tmp.csv'

while IFS=',' read -r a b c d e f g;
do
  echo "$d"
done < "tmp.csv"

rm "tmp.csv"
