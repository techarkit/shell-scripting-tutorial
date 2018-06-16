#!/bin/bash
#Purpose: Real time CPU utilization Monitoring
#Version:1.0
#Created Date: Tue Jun 5 21:33:38 IST 2018
#Modified Date:
#WebSite: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #
PATHS="/"
HOSTNAME=$(hostname)
CRITICAL=98
WARNING=90
CRITICALMail="YOUREMAILaddresS@Domain.com"
MAILWAR="YOUREMAIL@Domain.in"
mkdir -p /var/log/cputilhist
LOGFILE=/var/log/cputilhist/cpusage-`date +%h%d%y`.log

touch $LOGFILE

for path in $PATHS
do
        CPULOAD=`top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' |awk -F. '{print $1}'`
if [ -n $WARNING -a -n $CRITICAL ]; then
if [ "$CPULOAD" -ge "$WARNING" -a "$CPULOAD" -lt "$CRITICAL" ]; then
echo "`date "+%F %H:%M:%S"` WARNING - $CPULOAD on Host $HOSTNAME" >> $LOGFILE
echo "Warning Cpuload $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is Warning" $MAILWAR
exit 1
elif [ "$CPULOAD" -ge "$CRITICAL" ]; then
echo "`date "+%F %H:%M:%S"` CRITICAL - $CPULOAD on Host $HOSTNAME" >> $LOGFILE
echo "CRITICAL Cpuload $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is CRITICAL" $CRITICALMail
exit 2
else
echo "`date "+%F %H:%M:%S"` OK - $CPULOAD on $HOSTNAME" >> $LOGFILE
exit 0
fi
fi
done

# END #
