#!/bin/bash
## Collect Multiple Servers CPU, MEM and DISK Utilization and store in single file
# Purpose: To Collect Multiple Servers CPU, MEM, DISK usage in single report
# Version:1.0
# Created Date: 2019-05-02
# Modified Date:
# WebSite: https://arkit.co.in
# Author: Ankam Ravi Kumar

HOSTNAME=$(hostname)
DATET=$(date "+%Y-%m-%d %H:%M:%S")
CPUUSAGE=$(top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' |awk -F. '{print $1}')
MEMUSAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISKUSAGE=$(df -h / | awk '{print $5}' |tail -n 1 |sed 's/%//g')

echo 'HostName, Date&Time, CPU(%), MEM(%), DISK(%)' >> /opt/usagereport
echo "$HOSTNAME, $DATET, $CPUUSAGE, $MEMUSAGE, $DISKUSAGE" >> /opt/usagereport

for i in `cat /scripts/hostlist`
do
RHOST=$(ssh $i hostname)
RDATET=$(ssh $i 'date "+%Y-%m-%d %H:%M:%S"')
RCPUUSAGE=$(ssh $i top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' |awk -F. '{print $1}')
RMEMUSAGE=$(ssh $i free | grep Mem | awk '{print $3/$2 * 100.0}')
RDISKUSAGE=$(ssh $i df -P / |column -t | awk '{print $5}' |tail -n 1 |sed 's/%//g')

echo "$RHOST, $RDATET, $RCPUUSAGE, $RMEMUSAGE, $RDISKUSAGE" >> /opt/usagereport
done
