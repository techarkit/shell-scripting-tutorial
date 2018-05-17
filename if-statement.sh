#!/bin/bash
#Purpose: If statement example
#Version:1.0
#Created Date: Sat May 12 23:41:50 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #
echo -e "Please provide Value below ten: \c"
read -r value

if [ $value -le 10 ]
then
echo "You provided value is $value"
touch /tmp/test{1..100}.txt
echo "Script completed successfully"
fi

# END #
