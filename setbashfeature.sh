#!/bin/bash
#Purpose: Set assigns its arguments to the positional parameters
#Version:1.0
#website: https://arkit.co.in
#Created Date: Tue May 22 23:10:17 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #
set `date`
echo "Today is $1"
echo "Month is $2"
echo "Date is $3"
echo "Time H:M:S $4"
echo "TimeZone is $5"
echo "Year is $6"
set -x
# END #
