#!/bin/bash
#Purpose: While loop Continue Statement
#Version:1.0
#Website: https://arkit.co.in
#Created Date: Tue May 22 22:03:02 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #
opt=y
while [ $opt = y -o $opt = Y ]
do
echo -e "Please enter the number: \c"
read -r num
if [ $num -le 50 ]; then
sq=`expr $num \* $num`
echo "Square of provided number $num: $sq"
else
echo "Number not in the given Range"
fi

echo -e "Do you want to continue [y/n]: \c"
read -r wish
if [ $wish = y -o $wish = Y ]; then
continue
else
echo "Thank You for Exiting.."
exit
fi
done

# END #
