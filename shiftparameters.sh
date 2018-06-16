#!/bin/bash
#Purpose: Shifting positional parameters automatically
#Version:1.0
#Website: https://arkit.co.in
#Created Date: Tue May 22 22:55:50 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #
set `date`
echo "Count $#"
echo "$1 $2 $3 $4 $5"
shift 2
echo "$1 $2 $3 $4 $5"
# END #
