#!/bin/bash
#Purpose: Until Loop Example for Host Ping
#Version:1.0
#Created Date: Mon May 28 22:18:52 IST 2018
#Modified Date:
#WebSite: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #
echo -e "Please Enter the IP Address to Ping: \c"
read -r ip
until ping -c 3 $ip
do
        echo "Host $ip is Still Down"
        sleep 1
done

echo "Host $ip is Up Now"

# END #
