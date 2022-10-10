#!/bin/bash

n=1
until [ $n -gt 11196 ]
do
EXIRECORDS=$(mysql -u root -pmysql -h 192.168.2.100 -e "SELECT sn,tarsize from DATABASE.Table1 where sn='"$n"'" |tail -n1 |grep $n)

RECORDNUMBER=$(echo $EXIRECORDS |awk '{print $1}')
FOLDERSIZE=$(echo $EXIRECORDS |awk '{print $2}')

KB=$(echo $EXIRECORDS |awk '{print $2}' |grep K |wc -l)
        if [ $KB -ge 1 ]; then
                K=$(echo $EXIRECORDS |awk '{print $2}' |sed 's/K//g')
                BYTES=$($K * 1024 |bc |awk -F. '{print $1}')
                mysql -u root -pmysql -h 192.168.2.100 -e "UPDATE DATABASE.Table1 SET tarsize='"$BYTES"' where sn='"$RECORDNUMBER"'"
        fi

MB=$(echo $EXIRECORDS |awk '{print $2}' |grep M |wc -l)
        if [ $MB -ge 1 ]; then
                M=$(echo $EXIRECORDS |awk '{print $2}' |sed 's/M//g')
                BYTES=$(echo $M*1024*1024 |bc |awk -F. '{print $1}')
                mysql -u root -pmysql -h 192.168.2.100 -e "UPDATE DATABASE.Table1 SET tarsize='"$BYTES"' where sn='"$RECORDNUMBER"'"
        fi

GB=$(echo $EXIRECORDS |awk '{print $2}' |grep G |wc -l)
        if [ $GB -ge 1 ]; then
                G=$(echo $EXIRECORDS |awk '{print $2}' |sed 's/G//g')
                BYTES=$(echo $G*1024*1024*1024 |bc |awk -F. '{print $1}')
                mysql -u root -pmysql -h 192.168.2.100 -e "UPDATE DATABASE.Table1 SET tarsize='"$BYTES"' where sn='"$RECORDNUMBER"'"
        fi

TB=$(echo $EXIRECORDS |awk '{print $2}' |grep T |wc -l)
        if [ $TB -ge 1 ]; then
                T=$(echo $EXIRECORDS |awk '{print $2}' |sed 's/T//g')
                BYTES=$(echo $T*1024*1024*1024*1024 |bc |awk -F. '{print $1}')
                mysql -u root -pmysql -h 192.168.2.100 -e "UPDATE DATABASE.Table1 SET tarsize='"$BYTES"' where sn='"$RECORDNUMBER"'"
        fi


n=`expr "$n" + 1`

done
