#!/bin/bash

(gawk -f changeModificationTime.awk final\ product/OEBPS/content.opf > final\ product/OEBPS/content.opf.temp) && rm final\ product/OEBPS/content.opf
cp final\ product/OEBPS/content.opf.temp final\ product/OEBPS/content.opf && rm final\ product/OEBPS/content.opf.temp

if [ $# -eq 0 ]
  then
    echo "No git commit message specified"
exit 1
fi

if [ $# -gt 1 ]
then
echo "More than one commit message. Did you forget quotes?"
exit 1
fi

git commit -am "$1"