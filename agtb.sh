#!/bin/bash
#Purpose: eval command Evaluating twice
#Version:1.0
#Created Date: Wed Jun 13 22:09:59 IST 2018
#Modified Date:
#WebSite: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #

echo -e "enter the a value: \c"
read a
echo -e "enter the b value: \c"
read b
if test "$a" -gt "$b" ; then
        echo "$a is greater than $b"
else
        echo "$b is greater than $a"
fi

# END #