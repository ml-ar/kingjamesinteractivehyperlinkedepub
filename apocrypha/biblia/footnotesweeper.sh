#!/bin/bash


#uses the verseandfootnoteextractor program to put the footnotes in a text file

rm footnotes.txt;
find . -mindepth 2 -iname "*.html" -exec gawk -f verseandfootnoteextractor.awk {} \; >> footnotes.txt