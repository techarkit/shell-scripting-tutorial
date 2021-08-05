#!/usr/bin/expect -f
## Testing expect command

## echo the test
puts "\nGet HostName\n"

## execute ssh command to connect to remote host
spawn ssh 192.168.175.130 "hostname"

## Look for password string
expect "password:"

## Send the password
send "redhat\r"

puts "\nGet df command output\n"
spawn ssh 192.168.175.130 "df -h"
expect "password:"
send "redhat\r"
interact
