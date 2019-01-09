#!/bin/bash
#Purpose: To Know S3 Bucket Size Shell Script
#Version:1.0
#Created Date: 09-Jan-2019
#Modified Date:
#WebSite: https://www.server-computer.com
#Author: Ankam Ravi Kumar
# START #
echo -e "Please Enter your Bucket Name: \c"
read -r BUCKETNAME
aws s3api list-objects --bucket $BUCKETNAME --output json --query "[sum(Contents[].Size)]" > $PWD/s3bucket
sed -i 's/\[//' $PWD/s3bucket
sed -i 's/]//' $PWD/s3bucket
sed -i 's/ //' $PWD/s3bucket
cat $PWD/s3bucket |head -2 |tail -1 |awk '{print int($1/1024)" KB"}'
cat $PWD/s3bucket |head -2 |tail -1 |awk '{print int($1/1024/1024)" MB"}'
cat $PWD/s3bucket |head -2 |tail -1 |awk '{print int($1/1024/1024/1024)" GB"}'
cat $PWD/s3bucket |head -2 |tail -1 |awk '{print int($1/1024/1024/1024/1024)" TB"}
