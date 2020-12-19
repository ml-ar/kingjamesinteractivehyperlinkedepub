#!/bin/bash

#simple script to count the footnotes in the htmls

rm numoffootnotes.txt
echo "1-esdras footnotes: " >> numoffootnotes.txt
find . -iname "*1-esdras*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "1-maccabees footnotes: " >> numoffootnotes.txt
find . -iname "*1-maccabees*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "2-esdras footnotes: " >> numoffootnotes.txt
find . -iname "*2-esdras*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "2-maccabees footnotes: " >> numoffootnotes.txt
find . -iname "*2-maccabees*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "baruch footnotes: " >> numoffootnotes.txt
find . -iname "*baruch*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "bel-and-the-dragon footnotes: " >> numoffootnotes.txt
find . -iname "*bel-and-the-dragon*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "esther footnotes: " >> numoffootnotes.txt
find . -iname "*esther*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "judith footnotes: " >> numoffootnotes.txt
find . -iname "*judith*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "prayer-of-manasseh footnotes: " >> numoffootnotes.txt
find . -iname "*prayer-of-manasseh*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "sirach footnotes: " >> numoffootnotes.txt
find . -iname "*sirach*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "song-of-three-youths footnotes: " >> numoffootnotes.txt
find . -iname "*song-of-three-youths*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "susanna footnotes: " >> numoffootnotes.txt
find . -iname "*susanna*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "tobit footnotes: " >> numoffootnotes.txt
find . -iname "*tobit*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
echo "wisdom-of-solomon footnotes: " >> numoffootnotes.txt
find . -iname "*wisdom-of-solomon*.html" -exec grep -o 'id="footnote' {} \+ | wc -l >> numoffootnotes.txt
