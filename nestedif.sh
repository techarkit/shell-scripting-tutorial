#!/bin/bash
#Purpose: Validate and report Student subject marks
#Version:1.0
#Created Date: Wed May 16 19:00:52 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #

echo -e "Please Enter Maths Marks: \c"
read -r m
echo -e "Please Enter Physics Marks: \c"
read -r p
echo -e "Please Enter Chemistry Marks: \c"
read -r c

if [ $m -ge 35 -a $p -ge 35 -a $c -ge 35 ]; then
total=`expr $m + $p + $c`
avg=`expr $total / 3`
echo "Total Marks = $total"
echo "Average Marks = $avg"
      if [ $avg -ge 75 ]; then
      echo "Congrats you got Distinction"
      elif [ $avg -ge 60 -a $avg -lt 75 ]; then
      echo "Congrats you got First Class"
      elif [ $avg -ge 50 -a $avg -lt 60 ]; then
      echo "You got second class"
      elif [ $avg -ge 35 -a $avg -lt 50 ]; then
      echo "You Got Third Class"
      fi
else
echo "Sorry You Failed"
fi

# END #
