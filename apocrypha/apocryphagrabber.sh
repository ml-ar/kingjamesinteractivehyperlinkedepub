#!/bin/bash


books=( "1-esdras" "2-esdras" "tobit" "judith" "esther" "wisdom-of-solomon" "sirach" "baruch" "song-of-three-youths" "susanna" "bel-and-the-dragon" "prayer-of-manasseh" "1-maccabees" "2-maccabees" )

for i in "${books[@]}"
do

if [ ! -d "$i/" ]; then
mkdir "$i"
fi;

cd "$i"




#calibrate starting chapter and verses for the books
if [ "$i" = "esther" ]; #only get esther 10:4 and up
	then
	let chapter=10; let verse=4;
elif [ "$i" = "song-of-three-youths" -o  "$i" = "prayer-of-manasseh" -o "$i" = "bel-and-the-dragon" -o "$i" = "susanna" ] #doesn't have chapters
	then
	chapter=; verse=; #setting chapter and verse to empty
else
	let chapter=1; let verse=1; #start chapter and verse at 1
fi


#convention for file names is chapter-verse

if [ ! $chapter ] && [ ! $verse ] && [ ! -e "$i"'.txt' ]; #works
	then
    curl "https://biblia.com/bible/av1873/$i" > "$i"'.txt'
else
	while true; #set up a while loop for grabbing other things
	do
	    grep1=; grep2=; #exit codes for grep
		if [ ! -e "$i $chapter-$verse" ]; then
		    echo "curling " "$i $chapter:$verse"
			curl -s "https://biblia.com/bible/av1873/$i/$chapter/$verse" > output.txt
			grep "<title>Not Found" output.txt;
			grep1=$?
			grep "$chapter:$verse" output.txt
			grep2=$?
			if [ $grep1 -eq 0 ] && [ $grep2 -ne 0 ]; #couldn't find the verse and chapter 
			then
				if [ $verse -eq 1 ]; #break because we've reset the chapter and verse but there's nothing to be found
				then
					echo "reached end of $i"
					break
				else
					echo "reached end of chapter $chapter"
					let chapter=$chapter+1
					let verse=1
				fi
			else
				cp output.txt "$i $chapter-$verse"
		        let verse=$verse+1
			fi
		else
			  echo "already have $i $chapter-$verse"
			  let verse=$verse+1
		fi
		
	
	done;
fi

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
