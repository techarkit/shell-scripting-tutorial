#!/bin/bash
#Purpose: regex examples
#Version: 1.0
#Create Date: Sun Nov 27 00:27:33 EST 2022
#Modified Date:

# START #

numString1="1234"
numString2="16789"
numString3="1579"


echo "Example 1"
if [[ $numString1 =~ ^1 ]]; then
	echo "String \"$numString1\" starts with a \"1\", and matches regex: ^1"
fi

echo "Example 2"
if [[ $numString2 =~ ^1 ]]; then
        echo "String \"$numString2\" starts with a \"1\", and matches regex: ^1"
fi

echo "Example 3"
if [[ $numString3 =~ ^1.7 ]]; then
        echo "String \"$numString2\" starts with a \"1\", followed by any character, and followed by a 7. "
        echo "This string matches the regex: ^1.7"
fi

echo "Example 4"
if [[ ! $numString1 =~ ^1.7 ]]; then
        echo "String \"$numString1\" does not start with a \"1\", followed by any character, and followed by a 7. "
        echo "This string does not match the regex: ^1.7"
fi

echo "Example 5"
if [[ $numString2 =~ 9$ ]]; then
	echo "String \"$numString2\" ends with a \"9\", and matches the regex: 9$"
fi

