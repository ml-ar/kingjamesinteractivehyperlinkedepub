#!/bin/bash

#just a simple script to correct discrepancies

if [ $# -eq 0 ]
then
echo "ERROR: you must pass footnote file to the script."
exit 0
fi

if [[ ! -f "$1" ]];
then
echo "$1 is not a file"; exit 2;
fi

gawk -f corrections.awk "$1" > tempfootnotes.txt;
if [ $? -eq 0 ]; then
cp tempfootnotes.txt "$1";
rm tempfootnotes.txt;
else
echo "ERROR: discrepancy found, check tempfootnotes.txt"
fi;