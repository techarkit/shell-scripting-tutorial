#!/bin/bash
#Purpose: Here Document Example
#Version:1.0
#Created Date: Tue Jun 12 22:50:23 IST 2018
#Modified Date:
#WebSite: https://arkit.co.in
#Author: Ankam Ravi Kumar
# START #
ftp -n <<- EOF 2> /dev/null
        open ftp.server.com
        user ftp ftp
        ascii
        cd uploadfolder
        mput file1 file1 file2
        bye
EOF

