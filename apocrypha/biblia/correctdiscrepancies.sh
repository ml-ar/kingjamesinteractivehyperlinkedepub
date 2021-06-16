#!/bin/bash

#just a simple script to correct discrepancies

gawk -f corrections.awk footnotes.txt > tempfootnotes.txt;
if [ $? -eq 0 ]; then
cp tempfootnotes.txt footnotes.txt;
rm tempfootnotes.txt;
fi;