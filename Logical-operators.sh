#!/bin/bash
#Purpose: Logical Operators/Boolean Operators. Student Marks Validation.
#Version:1.0
#Created Date: Sat May 12 21:21:03 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #
echo -e "Enter Your Maths Subject Marks: \c"
read -r m
echo -e "Enter Your Physics Subject Marks: \c"
read -r p
echo -e "Enter Your Chemistry Subject Marks: \c"
read -r c

if test $m -ge 35 -a $p -ge 35 -a $c -ge 35
then
echo "Congratulations, You have passed in all subjects"
else
echo "Sorry You not upto mark in one of the subject"
fi
# END #
