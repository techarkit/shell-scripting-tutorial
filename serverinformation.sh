#!/bin/bash

mkdir -p /Inventory
sudo chmod -R 777 /Inventory/
mkdir -p /tmp/asset
touch /tmp/asset/hostname.txt
if [ -f /tmp/asset/hostname.txt ];then
  echo "File /tmp/asset/hostname.txt Exists"
else
  mkdir /tmp/asset
  touch /tmp/asset/hostname.txt
fi
touch /tmp/temptext
TEMP=/tmp/temptext
LOG=`ls /tmp/asset/hostname.txt`
echo "## Host Information" > $LOG
echo "Host Name : `hostname` " >> $LOG
echo "`sudo /sbin/ifconfig -a |grep "inet" | awk 'BEGIN { FS = ":" } ; { print $2 }'`" >> $TEMP
echo "IP Address : `egrep '^10' $TEMP |awk '{ print $1}'`" >> $LOG
echo "IP Address: `hostname -I`" >> $LOG
echo "ip a |grep inet |grep -v "::" |awk '{print $2}'" >> $LOG
echo "iDrac Details: `racadm getniccfg |grep "IP Address" |grep -v "::"`" >> $LOG
echo "Server Type: `servertype=$(lscpu | grep Hypervisor | wc -l); if [ $servertype -gt 0 ]; then echo "VitualMachine"; else echo "Physical"; fi`" >> $LOG
echo -en '\n' >> $LOG

## Collecting Hardware Details ##
echo " " >> $LOG
echo "## Hardware Information" >> $LOG
echo " " >> $LOG
echo "Serial Number     : `sudo lshal |grep system.hardware.serial`" >> $LOG
echo "Serial Number     : `sudo /usr/sbin/dmidecode -s system-serial-number`" >> $LOG
echo "Serial Number     : `sudo cat /sys/class/dmi/id/product_serial`" >> $LOG
echo "Model Number      : `sudo lshal |grep system.hardware.product`" >> $LOG
echo "Model Number      : `sudo /usr/sbin/dmidecode |grep "SKU Number"`" >> $LOG
echo "Model Number      : `sudo cat /sys/class/dmi/id/product_name`" >> $LOG
echo "Hardware Vendor   : `sudo lshal |grep system.hardware.vendor`" >> $LOG
echo "Hardware Vendor   : `sudo cat /sys/class/dmi/id/chassis_vendor`" >> $LOG
echo "Hardware Info     : `sudo dmesg |grep DMI`" >> $LOG

## Redhat Version ##
echo " " >> $LOG
echo "## OS Version" >> $LOG
head -n1 /etc/issue >> $LOG
cat /etc/redhat-release >> $LOG
echo "Kernel Version: `uname -r`">> $LOG
echo "OS Version: `hostnamectl | egrep "Operating System" | cut -d ' ' -f5-`" >> $LOG

## CPU Info ##
echo " " >> $LOG
echo " " >> $LOG
echo "## CPU Information" >> $LOG
grep "model name" /proc/cpuinfo |uniq >> $LOG
COUNTT=$(cat /proc/cpuinfo |grep "model name" | wc -l)
echo "$COUNTT Cores" >> $LOG

## RAM/MEMORY Info ##
echo " " >> $LOG
echo " " >> $LOG
echo "## Memory Information" >> $LOG
grep MemTotal /proc/meminfo >> $LOG
y=`grep MemTotal /proc/meminfo |awk '{ print $2 }'`
mb="$(( $y / 1024 ))"
gb="$(( $mb / 1024 ))"
echo "RAM : $gb GB" >> $LOG

## Swap Information ##
echo " " >> $LOG
echo "## Swap Information" >> $LOG
y1=$(free -k |grep Swap |awk '{print $2}')
mb1="$(( $y1 / 1024 ))"
gb1="$(( $mb1 / 1024 ))"
echo "Swap Size: $gb1 GB" >> $LOG

## Disk Information ##
echo " " >> $LOG
echo "## Disk Information" >> $LOG
lsblk |grep -E 'part|disk' $LOG

## LVM Information ##
echo " " >> $LOG
echo "## Physical Volumes" >> $LOG
pvs >> $LOG

echo " " >> $LOG
echo "## Volume Groups" >> $LOG
vgs >> $LOG

echo " " >> $LOG
echo "## Logical Volumes" >> $LOG
lvs >> $LOG
echo " " >> $LOG

## Partition Information ##
echo "## DF Command Output" >> $LOG
echo " " >> $LOG
df -Ph -x tmpfs -x devtmpfs| sed s/%//g | awk '{ if($5 > 0) print $0;}' >> $LOG

echo " " >> $LOG
echo "## Port Information" >> $LOG
ss -alntup |column -t |grep -E 'tcp|udp' >> $LOG

echo " " >> $LOG
echo "## Service Information" >> $LOG
systemctl list-units --type=service --state=running |grep -vE 'systemd|selinux' >> $LOG

echo " " >> $LOG
echo "## Docker Containers" >> $LOG
sudo docker ps -a >> $LOG

echo " " >> $LOG
echo "## DNS Server Details" >> $LOG
cat /etc/resolv.conf >> $LOG

echo "" >> $LOG
echo "## Server Uptime" >> $LOG
uptime >> $LOG

sudo cp /tmp/asset/`hostname`.txt /Inventory/`hostname`-`date "+%Y-%m-%d"`.txt
