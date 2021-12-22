#!/bin/bash
#Purpose: If else statement example
#Version:1.0
#Created Date: Sat May 12 23:49:15 IST 2018
#Modified Date:
#Website: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #
echo -e "Enter any value: \c"
read -r a
echo -e "Enter any value: \c"
read -r b

if [ $a -gt $b ]; then
echo "$a is greater than $b"
else
echo "$b is greater than $a"
fi
# END #
