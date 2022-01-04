#!/bin/bash
#Purpose: Find biggest Number among 4 digits
#Version:1.0
#Created Date: Wed May 16 18:45:58 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #

echo -e "Please Enter a Value: \c"
read -r a
echo -e "Please Enter b Value: \c"
read -r b
echo -e "Please Enter c Value: \c"
read -r c
echo -e "Please Enter d Value: \c"
read -r d

if [ $a -gt $b -a $a -gt $c -a $a -gt $d ]; then
echo "$a a is big"
elif [ $b -gt $c -a $b -gt $d ]; then
echo "$b b is big"
elif [ $c -gt $d ]; then
echo "$c c is big"
else
echo "$d d is big"
fi

# END #
