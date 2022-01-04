#!/bin/bash
#Purpose: Arthemetic Operators
#Version:1.0
#Created Date: Wed May 9 21:41:53 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #

echo -e "Please enter some value: \c"
read -r a
echo -e "Please enter another value: \c"
read -r b

echo "a+b value is $(($a+$b))"    #it will add both the values
echo "a-b value is $(($a-$b))"    #it will subtract b form a 
echo "axb value is $(($a*$b))"    #it will multiply both a and b
echo "a/b value is $(($a/$b))"    #it will divide b from a
echo "a%b value is $(($a%$b))"    #it will give the remainder when a is divided by b

echo "Completed successfully"

# END #
