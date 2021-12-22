#!/bin/bash
#Purpose: OR operator example
#Version:1.0
#Created Date: Sat May 12 21:26:51 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #

echo -e "Enter First Numeric Value: \c"
read -r t
echo -e "Enter Second Numeric Value: \c"
read -r b

if [ $t -le 20 -o $b -ge 30 ]; then
echo "Statement is True"
else
echo "False Statement, Try Again."
fi

# END #
