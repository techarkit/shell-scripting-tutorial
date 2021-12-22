#!/bin/bash
#Purpose: eval command Evaluating twice
#Version:1.0
#Created Date: Wed Jun 13 22:09:59 IST 2018
#Modified Date:
#WebSite: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #

tmp=`date | cut -c12-13`
if [ $tmp -lt 11 ] ; then
echo "Good Mornind have a nice day $USERNAME"
elif [ $tmp -gt 11 -a $tmp -lt 16 ] ; then
echo "Good Ofter noon $USERNAME"
elif [ $tmp -gt 15 -a $tmp -lt 19 ] ; then
echo "Good Evening $USERNAME"
else 
echo "Good Night Sweet dreams $USERNAME"
fi
echo "Now the time is `date |cut -c12-19`"

# END #
