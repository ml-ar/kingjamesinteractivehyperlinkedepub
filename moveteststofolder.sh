#!/bin/bash

mkdir newfolder;
cd newfolder && touch lol && rm * && cd ..;

for i in *xhtml.test; do
cp "$i" newfolder/"${i%%.test}"



done
