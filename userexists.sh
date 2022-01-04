#!/bin/bash
##Purpose: Check given user Exits Or Not 
##Date: 27th Oct 2016
##Author: Ankam Ravi Kumar
##WebSite: https://arkit.co.in

##Start
echo -e "Please Enter User name you want check: \c"
read user
grep $user /etc/passwd > /dev/null
if [ $? -eq 0 ]; then
grep $user /etc/passwd 
echo "$user Exists in this Machine"
else
echo "$user does not exists"
fi

##END
