#!/bin/bash

#format of URL: https://www.kingjamesbibleonline.org/Tobit-Chapter-1_Original-1611-KJV/


books=( "1-Esdras" "2-Esdras" "Tobit" "Judith" "Additions-to-Esther" "Wisdom-of-Solomon" "Ecclesiasticus" "Baruch" "Letter-of-Jeremiah"  "Prayer-of-Azariah" "Susanna" "Bel-and-the-Dragon" "Prayer-of-Manasseh" "1-Maccabees" "2-Maccabees" )

for i in "${books[@]}"
do

if [ ! -d "$i/" ]; then
mkdir "$i"
fi;

cd "$i"




#calibrate starting chapter and verses for the books
if [ "$i" = "Additions-to-Esther" ]; #only get esther 10:4 and up
	then
	let chapter=10;
else
	let chapter=1; #start chapter and verse at 1
fi


#convention for file names is chapter-verse

	while true; #set up a while loop for grabbing other things
	do
	    grep1=; #exit code for grep
		if [ ! -e "$i $chapter.txt" ]; then
		    echo "curling $i, chapter $chapter"
			curl -s "https://www.kingjamesbibleonline.org/$i-Chapter-""$chapter""_Original-1611-KJV/" > output.txt
			grep 'The last chapter is displayed instead' output.txt;
			grep1=$?
			if [ $grep1 -eq 0 ] #couldn't find the chapter 
			then
				break
			else
				cp output.txt "$i $chapter.txt"
			fi
		else
			  echo "already have $i $chapter-$verse"
		fi
		let chapter=$chapter+1
		
	
	done;

rm *output*
cd ..

done

#important: Esther 10:4 and onward (to 16:24) are apocrypha
#song-of-three-youths is not divided into chapters and verses
#neither is prayer-of-manasseh

#Also some footnotes are buried in with the cambridge bible footnotes: for example, there's only one footnote for 1 Esdras 1:1 which is "2 Kin. 23. 21. To ver. 22, 2 Chr. 35. 1–19."


#1 Maccabees 7:41: footnote missing in the biblia source!

#1,018 KJV apocryphal notes in total

#there are at least 8 notes that are not parseable with curl, will have to add manually

#Susanna header footnote text: 'Gr. Bels Dragon' Preceding text: 'Set apart from the beginning of Daniel, because it is not in the Hebrew, as neither the Narration of '

#Bel and the dragon header, footnote text: 'Gr. Bels Dragon' Preceding text: 'The History of the Destruction of '

#will have to manually add in sirach marginal notes in the prologue:

	#'Some refer this Prologue to Athanasius, because it is found in his Synopsis.' occurs immediately before the first prologue
	
	#footnote text: 'Or, collected.' Preceding text: 'This Jesus was the son of Sirach, and grandchild to Jesus of the same name with him: this man therefore lived in the latter times, after the people had been led away captive, and called home a again, and almost after all the prophets. Now his grandfather Jesus, as he himself witnesseth, was a man of great diligence and wisdom among the Hebrews, who did not only gather the grave and short sentences of wise men, that had been before him, but himself also uttered some of his own, full of much understanding and wisdom. When as therefore the first Jesus died, leaving this book almost '
	
	#second prologue manual notes:
	
	#footnote text: 'Or, of another nation.' Preceding text: 'Whereas many and great things have been delivered unto us by the law and the prophets, and by others that have followed their steps, for the which things Israel ought to be commended for learning and wisdom; and whereof not only the readers must needs become skilful themselves, but also they that desire to learn be able to profit them which are '
	
	#footnote text: 'Gr. prophecics.' Preceding text: 'Whereas many and great things have been delivered unto us by the law and the prophets, and by others that have followed their steps, for the which things Israel ought to be commended for learning and wisdom; and whereof not only the readers must needs become skilful themselves, but also they that desire to learn be able to profit them which are without, both by speaking and writing: my grandfather Jesus, when he had much given himself to the reading of the law, and the prophets, and other books of our fathers, and had gotten therein good judgment, was drawn on also himself to write something pertaining to learning and wisdom; to the intent that those which are desirous to learn, and are addicted to these things, might profit much more in living according to the law. Wherefore let me intreat you to read it with favour and attention, and to pardon us, wherein we may seem to come short of some words, which we have laboured to interpret. For the same things uttered in Hebrew, and translated into another tongue, have not the same force in them: and not only these things, but the law itself, and the '
	
	#footnote text: 'Or, excellency.' Preceding text: 'Whereas many and great things have been delivered unto us by the law and the prophets, and by others that have followed their steps, for the which things Israel ought to be commended for learning and wisdom; and whereof not only the readers must needs become skilful themselves, but also they that desire to learn be able to profit them which are without, both by speaking and writing: my grandfather Jesus, when he had much given himself to the reading of the law, and the prophets, and other books of our fathers, and had gotten therein good judgment, was drawn on also himself to write something pertaining to learning and wisdom; to the intent that those which are desirous to learn, and are addicted to these things, might profit much more in living according to the law. Wherefore let me intreat you to read it with favour and attention, and to pardon us, wherein we may seem to come short of some words, which we have laboured to interpret. For the same things uttered in Hebrew, and translated into another tongue, have not the same force in them: and not only these things, but the law itself, and the prophets, and the rest of the books, have no small '
	
	#footnote text: 'Or, help of learning.' Preceding text: 'Whereas many and great things have been delivered unto us by the law and the prophets, and by others that have followed their steps, for the which things Israel ought to be commended for learning and wisdom; and whereof not only the readers must needs become skilful themselves, but also they that desire to learn be able to profit them which are without, both by speaking and writing: my grandfather Jesus, when he had much given himself to the reading of the law, and the prophets, and other books of our fathers, and had gotten therein good judgment, was drawn on also himself to write something pertaining to learning and wisdom; to the intent that those which are desirous to learn, and are addicted to these things, might profit much more in living according to the law. Wherefore let me intreat you to read it with favour and attention, and to pardon us, wherein we may seem to come short of some words, which we have laboured to interpret. For the same things uttered in Hebrew, and translated into another tongue, have not the same force in them: and not only these things, but the law itself, and the prophets, and the rest of the books, have no small difference, when they are spoken in their own language. For in the eight and thirtieth year coming into Egypt, when Euergetes was king, and continuing there some time, I found a '
