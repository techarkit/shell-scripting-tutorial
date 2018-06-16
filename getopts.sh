#!/bin/bash
#Purpose: Getopts Examples working with arguments
#Version:1.0
#Created Date: Wed May 30 22:30:51 IST 2018
#Modified Date:
#WebSite: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #

while getopts :a:b: options; do
        case $options in
                a) ap=$OPTARG;;
                b) bo=$OPTARG;;
                ?) echo "I Dont know What is $OPTARG is"
        esac
done

echo "Option A = $ap and Option B = $bo"

# END #
