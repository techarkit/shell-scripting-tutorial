#!/bin/bash
#Purpose: Array Example
#Version:1.0
#Created Date: Mon May 28 22:59:22 IST 2018
#Modified Date:
#WebSite: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #

fruits=( "Apple" "Orange" "Banana" "Sapota" )
fruits[3]='Green Apple'
for fruit in ${fruits[@]}
do
        echo "Fruit Name is $fruit"
done

echo "Number of Fruits in Bucket is" ${#fruits[@]}
echo "All Fruits ${fruits[@]}"

# END #
