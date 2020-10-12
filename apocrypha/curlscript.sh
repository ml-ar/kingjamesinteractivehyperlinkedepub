#!/bin/bash


books=('1-esdras' '2-esdras' 'tobit' 'judith' 'esther' 'wisdom-of-solomon' 'sirach' 'baruch' 'song-of-three-youths' 'susanna' 'bel-and-the-dragon' 'prayer-of-manasseh' '1-maccabees' '2-maccabees')

#important: Esther 10:4 and onward (to 16:24) are apocrypha
#song-of-three-youths is not divided into chapters and verses
#neither is prayer-of-manasseh


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