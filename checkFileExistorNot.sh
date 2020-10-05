#!/bin/bash

# Name           : Vikas V
# Creation date  : 10-06-2020
# Parameters     : '<InputPath>' '<InputFilename>'
# Function       : checkFileExistorNot
# Purpose        : This function can be used to check file exist at path or not  
# Execution step : replace the calling function mentioned at below with your path and file name , and run scritp using sh checkFileExistorNot.sh

checkFileExistorNot()
{

# Parameters defined 
InputPath=$1
InputFilename=$2 

# Checking the parameters entered from user or not
if [ -z ${InputPath} ]
then
    echo "Fail    : Path : $InputPath : Parameter is not defined "
else
    echo "Success : Path : $InputPath : Parameter is defined"
fi 

if [ -z ${InputFilename} ]
then
    echo "Fail    : Path : $InputFilename : Parameter is not defined "  
else
    echo "Success : Path : $InputFilename : Parameter is defined"
fi 

[ -d $InputPath ] > /dev/null
statuschk=$?

if [ $statuschk -eq 0 ]
then 
    
    echo "Checking started ....."

    # Checking the file exist at path or not 
    [  -f $InputPath/$InputFilename ] > /dev/null 
    
    status=$?
    if [ $status -eq 0 ]
    then
    echo "Success : File : $InputFilename  exist at following path : $InputPath"
    else    
    echo "Fail    : File : $InputFilename  does not exist at following path : $InputPath"
    fi       

else
    
    echo "Entered path : $InputPath  does not exist, please enter valid path"

fi    

}

# Calling function [enter your path and filename to test this function at your end]
checkFileExistorNot '/abc/' 'F_function_list.txt'



