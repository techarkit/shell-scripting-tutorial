#!/bin/bash
#Purpose: For loop example
#Version:1.0
#website: https://arkit.co.in
#Created Date: Wed May 16 19:26:02 IST 2018
#Modified Date:
#Author: Ankam Ravi Kumar
# START #
for server in `cat /scripts/servers`
do
ping -c 1 $server > /tmp/ping
valid=`echo $?`
if [ $valid -eq 0 ]; then
echo "$server is up"
else
echo "$server is Down"
fi
done
# END #
