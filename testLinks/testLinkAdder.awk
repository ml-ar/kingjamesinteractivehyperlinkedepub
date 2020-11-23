BEGIN {

	OFS = ""

#bookRegex holds the regexes for the book, which should match the text of a marginal reference.

#Old testament
		bookRegex["Genesis"] = "(Gen\\.?)"
		bookRegex["Exodus"] = "(Ex\\.?)"
		bookRegex["Leviticus"] = "(Lev\\.?)"
		bookRegex["Numbers"] = "(Num\\.?)"
		bookRegex["Deuteronomy"] = "([Dd]eut\\.?)"
		bookRegex["Joshua"] = "(Josh)"
		bookRegex["Judges"] = "(Judg.)"
		bookRegex["Ruth"] = "(Ruth)"
		bookRegex["1 Samuel"] = "(1 Sam\\.?)"
		bookRegex["2 Samuel"] = "(2 Sam\\.?)"
		bookRegex["1 Kings"] = "(1 Kin\\.?)|(1 Kings)"
		bookRegex["2 Kings"] = "(2 Kin\\.?)|(2 Kings)"
		bookRegex["1 Chronicles"] = "(1 Chr\\.?)"
		bookRegex["2 Chronicles"] = "(2 Chr\\.?)"
		bookRegex["Ezra"] = "(Ezra)"
		bookRegex["Nehemiah"] = "(Neh\\.?)"
		bookRegex["Esther"] = "(Esth\\.?)"
		bookRegex["Psalms"] = "(Ps\\.?)"
		bookRegex["Proverbs"] = "(Prov\\.?)"
		bookRegex["Ecclesiastes"] = "(Eccles\\.?)"
		bookRegex["Job"] = "(Job)"
		bookRegex["Isaiah"] = "(Is\\.?)|(Isai\\.?)"
		bookRegex["Jeremiah"] = "(Jer\\.?)"
		bookRegex["Lamentations"] = "(Lam\\.?)"
		bookRegex["Ezekiel"] = "(Ezek?\\.?)" #haven't confirmed simply "Eze" as a note but there is likely nothing else like that
		bookRegex["Daniel"] = "(Dan\\.?)"
		bookRegex["Hosea"] = "(Hos\\.?)"
		bookRegex["Joel"] = "(Joel)"
		bookRegex["Amos"] = "(Amos)"
		bookRegex["Obadiah"] = "(Obad\\.?)"
		bookRegex["Jonah"] = "(Jonah)"
		bookRegex["Micah"] = "(Mic\\.?)"
		bookRegex["Nahum"] = "(Nah\\.?)"
		bookRegex["Habakkuk"] = "(Hab\\.?)"
		bookRegex["Zephaniah"] = "(Zeph\\.?)"
		bookRegex["Haggai"] = "(Hag\\.?)"
		bookRegex["Zechariah"] = "(Zech\\.?)"
		bookRegex["Malachi"] = "(Mal\\.?)"

#Apocrypha
		bookRegex["1 Esdras"] = "(1 Esd\\.?)"
		bookRegex["2 Esdras"] = "(2 Esd\\.?)"
		bookRegex["Tobit"] = "(Tob\\.?)"
		bookRegex["Judith"] = "(Judith)"
		bookRegex["Wisdom"] = "(Wisd\\.?)"
		bookRegex["Sirach"] = "(Ecclus\\.?)"
		bookRegex["Baruch"] = "(Bar\\.?)"
		bookRegex["Ecclesiasticus"] = bookRegex["Sirach"] #sirach and ecclesiasticus is the same
		bookRegex["1 Maccabees"] = "(1 Mac\\.?)"
		bookRegex["2 Maccabees"] = "(2 Mac\\.?)"

#New testament
		bookRegex["Matthew"] = "(Matt\\.?)"
		bookRegex["Mark"] = "(Mark)"
		bookRegex["Luke"] = "(Luke)"
		bookRegex["John"] = "(John)"
		bookRegex["Acts"] = "(Acts)"
		bookRegex["Romans"] = "(Rom\\.?)"
		bookRegex["1 Corinthians"] = "(1 Cor\\.?)"
		bookRegex["2 Corinthians"] = "(2 Cor\\.?)"
		bookRegex["Galatians"] = "(Gal\\.?)"
		bookRegex["Ephesians"] = "(Eph\\.?)"
		bookRegex["Philippians"] = "(Phil\\.?)"
		bookRegex["Colossians"] = "(Col\\.?)"
		bookRegex["1 Thessalonians"] = "(1 Thess\\.?)"
		bookRegex["2 Thessalonians"] = "(2 Thess\\.?)"
		bookRegex["1 Timothy"] = "(1 Tim\\.?)"
		bookRegex["2 Timothy"] = "(2 Tim\\.?)"
		bookRegex["Hebrews"] = "(Heb\\.?)"
		bookRegex["James"] = "(James)"
		bookRegex["1 Peter"] = "(1 Pet\\.?)"
		bookRegex["2 Peter"] = "(2 Pet\\.?)"
		bookRegex["1 John"] = "(1 John)"
		bookRegex["Jude"] = "(Jude)"
		bookRegex["Revelation"] = "(Rev\\.?)"


#Verse labels refer to the letters before the verse numbers in the href, e.g., GEN1_1, verselabel is GEN

#Old Testament
		verseLabels["Genesis"] = "GN"
		verseLabels["Exodus"] = "EX"
		verseLabels["Leviticus"] = "LV"
		verseLabels["Numbers"] = "NM"
		verseLabels["Deuteronomy"] = "DT"
		verseLabels["Joshua"] = "JS"
		verseLabels["Judges"] = "JD"
		verseLabels["Ruth"] = "RT"
		verseLabels["1 Samuel"] = "S1"
		verseLabels["2 Samuel"] = "S2"
		verseLabels["1 Kings"] = "K1"
		verseLabels["2 Kings"] = "K2"
		verseLabels["1 Chronicles"] = "R1"
		verseLabels["2 Chronicles"] = "R2"
		verseLabels["Ezra"] = "ER"
		verseLabels["Nehemiah"] = "NH"
		verseLabels["Esther"] = "ET"
		verseLabels["Psalms"] = "PS"
		verseLabels["Proverbs"] = "PR"
		verseLabels["Ecclesiastes"] = "EC"
		verseLabels["Job"] = "JB"
		verseLabels["Isaiah"] = "IS"
		verseLabels["Jeremiah"] = "JR"
		verseLabels["Lamentations"] = "LM"
		verseLabels["Ezekiel"] = "EK"
		verseLabels["Daniel"] = "DN"
		verseLabels["Hosea"] = "HS"
		verseLabels["Joel"] = "JL"
		verseLabels["Amos"] = "AM"
		verseLabels["Obadiah"] = "OB"
		verseLabels["Jonah"] = "JH"
		verseLabels["Micah"] = "MC"
		verseLabels["Nahum"] = "NM"
		verseLabels["Habakkuk"] = "HK"
		verseLabels["Zephaniah"] = "ZP"
		verseLabels["Haggai"] = "HG"
		verseLabels["Zechariah"] = "ZC"
		verseLabels["Malachi"] = "ML"

#Apocrypha
		verseLabels["1 Esdras"] = "E1"
		verseLabels["2 Esdras"] = "E2"
		verseLabels["Tobit"] = "TB"
		verseLabels["Judith"] = "JT"
		verseLabels["Esther (Greek)"] = "EG"
		verseLabels["Rest of Esther"] = verseLabels["Esther (Greek)"]
		verseLabels["Wisdom"] = "WS"
		verseLabels["Sirach"] = "SR"
		verseLabels["Baruch"] = "BR"
		verseLabels["Ecclesiasticus"] = verseLabels["Sirach"] #sirach and ecclesiasticus is the same
		verseLabels["1 Maccabees"] = "M1"
		verseLabels["2 Maccabees"] = "M2"

#New Testament
		verseLabels["Matthew"] = "MT"
		verseLabels["Mark"] = "MK"
		verseLabels["Luke"] = "LK"
		verseLabels["John"] = "JN"
		verseLabels["Acts"] = "AC"
		verseLabels["Romans"] = "RM"
		verseLabels["1 Corinthians"] = "C1"
		verseLabels["2 Corinthians"] = "C2"
		verseLabels["Galatians"] = "GL"
		verseLabels["Ephesians"] = "EP"
		verseLabels["Philippians"] = "PP"
		verseLabels["Colossians"] = "CL"
		verseLabels["1 Thessalonians"] = "H1"
		verseLabels["2 Thessalonians"] = "H2"
		verseLabels["1 Timothy"] = "T1"
		verseLabels["2 Timothy"] = "T2"
		verseLabels["Philemon"] = "PM"
		verseLabels["Hebrews"] = "HB"
		verseLabels["James"] = "JM"
		verseLabels["1 Peter"] = "P1"
		verseLabels["2 Peter"] = "P2"
		verseLabels["1 John"] = "J1"
		verseLabels["Jude"] = "JD"
		verseLabels["Revelation"] = "RV"

		bookRegexCombined = bookRegex["Genesis"]

		for (i in bookRegex)
		{
			bookRegexCombined = bookRegexCombined "|(" bookRegex[i] ")"
		}

	bookRegexCombined = "(\\<)" bookRegexCombined


		bookFiles["Genesis"] = "GEN.xhtml"
		bookFiles["Exodus"] = "EXO.xhtml"
		bookFiles["Leviticus"] = "LEV.xhtml"
		bookFiles["Numbers"] = "NUM.xhtml"
		bookFiles["Deuteronomy"] = "DEU.xhtml"
		bookFiles["Joshua"] = "JOS.xhtml"
		bookFiles["Judges"] = "JDG.xhtml"
		bookFiles["Ruth"] = "RUT.xhtml"
		bookFiles["1 Samuel"] = "1SA.xhtml"
		bookFiles["2 Samuel"] = "2SA.xhtml"
		bookFiles["1 Kings"] = "1KI.xhtml"
		bookFiles["2 Kings"] = "2KI.xhtml"
		bookFiles["1 Chronicles"] = "1CH.xhtml"
		bookFiles["2 Chronicles"] = "2CH.xhtml"
		bookFiles["Ezra"] = "EZR.xhtml"
		bookFiles["Nehemiah"] = "NEH.xhtml"
		bookFiles["Esther"] = "EST.xhtml"
		bookFiles["Job"] = "JOB.xhtml"
		bookFiles["Psalms"] = "PSA.xhtml"
		bookFiles["Proverbs"] = "PRO.xhtml"
		bookFiles["Ecclesiastes"] = "ECC.xhtml"
		bookFiles["Song of Solomon"] = "SNG.xhtml"
		bookFiles["Isaiah"] = "ISA.xhtml"
		bookFiles["Jeremiah"] = "JER.xhtml"
		bookFiles["Lamentations"] = "LAM.xhtml"
		bookFiles["Ezekiel"] = "EZK.xhtml"
		bookFiles["Daniel"] = "DAN.xhtml"
		bookFiles["Hosea"] = "HOS.xhtml"
		bookFiles["Joel"] = "JOL.xhtml"
		bookFiles["Amos"] = "AMO.xhtml"
		bookFiles["Obadiah"] = "OBA.xhtml"
		bookFiles["Jonah"] = "JON.xhtml"
		bookFiles["Micah"] = "MIC.xhtml"
		bookFiles["Nahum"] = "NAM.xhtml"
		bookFiles["Habakkuk"] = "HAB.xhtml"
		bookFiles["Zephaniah"] = "ZEP.xhtml"
		bookFiles["Haggai"] = "HAG.xhtml"
		bookFiles["Zechariah"] = "ZEC.xhtml"
		bookFiles["Malachi"] = "MAL.xhtml"
		bookFiles["1 Esdras"] = "1ES.xhtml"
		bookFiles["2 Esdras"] = "2ES.xhtml"
		bookFiles["Tobit"] = "TOB.xhtml"
		bookFiles["Judith"] = "JDT.xhtml"
		bookFiles["Esther (Greek)"] = "ESG.xhtml"
		bookFiles["Wisdom of Solomon"] = "WIS.xhtml"
		bookFiles["Sirach"] = "SIR.xhtml"
		bookFiles["Ecclesiasticus"] = bookFiles["Sirach"]
		bookFiles["Baruch"] = "BAR.xhtml"
		bookFiles["The Song of the Three Holy Children"] = "S3Y.xhtml"
		bookFiles["Susanna"] = "SUS.xhtml"
		bookFiles["Bel and the Dragon"] = "BEL.xhtml"
		bookFiles["Prayer of Manasses"] = "MAN.xhtml"
		bookFiles["1 Maccabees"] = "1MA.xhtml"
		bookFiles["2 Maccabees"] = "2MA.xhtml"
		bookFiles["Matthew"] = "MAT.xhtml"
		bookFiles["Mark"] = "MRK.xhtml"
		bookFiles["Luke"] = "LUK.xhtml"
		bookFiles["John"] = "JHN.xhtml"
		bookFiles["Acts"] = "ACT.xhtml"
		bookFiles["Baruch"] = "BAR.xhtml"
		bookFiles["The Song of the Three Holy Children"] = "S3Y.xhtml"
		bookFiles["Susanna"] = "SUS.xhtml"
		bookFiles["Bel and the Dragon"] = "BEL.xhtml"
		bookFiles["Prayer of Manasses"] = "MAN.xhtml"
		bookFiles["1 Maccabees"] = "1MA.xhtml"
		bookFiles["2 Maccabees"] = "2MA.xhtml"
		bookFiles["Matthew"] = "MAT.xhtml"
		bookFiles["Mark"] = "MRK.xhtml"
		bookFiles["Luke"] = "LUK.xhtml"
		bookFiles["John"] = "JHN.xhtml"
		bookFiles["Acts"] = "ACT.xhtml"
		bookFiles["Romans"] = "ROM.xhtml"
		bookFiles["1 Corinthians"] = "1CO.xhtml"
		bookFiles["2 Corinthians"] = "2CO.xhtml"
		bookFiles["Galatians"] = "GAL.xhtml"
		bookFiles["Ephesians"] = "EPH.xhtml"
		bookFiles["Philippians"] = "PHP.xhtml"
		bookFiles["Colossians"] = "COL.xhtml"
		bookFiles["1 Thessalonians"] = "1TH.xhtml"
		bookFiles["2 Thessalonians"] = "2TH.xhtml"
		bookFiles["1 Timothy"] = "1TI.xhtml"
		bookFiles["2 Timothy"] = "2TI.xhtml"
		bookFiles["Titus"] = "TIT.xhtml"
		bookFiles["Philemon"] = "PHM.xhtml"
		bookFiles["Hebrews"] = "HEB.xhtml"
		bookFiles["James"] = "JAS.xhtml"
		bookFiles["1 Peter"] = "1PE.xhtml"
		bookFiles["2 Peter"] = "2PE.xhtml"
		bookFiles["1 John"] = "1JN.xhtml"
		bookFiles["2 John"] = "2JN.xhtml"
		bookFiles["3 John"] = "3JN.xhtml"
		bookFiles["Jude"] = "JUD.xhtml"
		bookFiles["Revelation"] = "REV.xhtml"













		chapterRegex = "\\<ch\\.?"
		verseRegex = "\\<ver\\.?"

}

#counts the chapter or verse digits that follow AFTER booksAndDigits[i]
#for example:
#if we have Lev. 26. 26. ch. 4. 16. &amp; 5. 16.
#then we should have:
#booksAndDigits[1] =  Lev.
#booksAndDigits[2] =  26.
#booksAndDigits[3] =  26.
#booksAndDigits[4] =  ch.
#booksAndDigits[5] =  4.
#booksAndDigits[6] =  16.
#booksAndDigits[7] =  5.
#booksAndDigits[8] =  16.

#corresponding return values for i:
#
#1: 2
#2: 2
#3: 1
#4: 2
#5: 2
#6: 1
#7: 2
#8: 1


#returns the book name from the array given its regex pattern
#regex: the pattern to match
function getBookNameFromBookRegex(regex,  j)
{
	for (j in bookRegex)
	{
		if (regex ~ bookRegex[j])
		{
                    return j;
		}
		if (!(j+1) in bookRegex)
		{
			print "Error finding book for booksAndDigits["i"] = " booksAndDigits[i]; exit 6
		}
	}
}


function getNumberOfDigitsProceedingInBooksAndDigits(i,  iAhead,  followingDigitsCounter)
{
	if (booksAndDigits[i] ~ /[[:digit:]]/ && booksAndDigits[i] !~ /[A-Za-z]/)
	{
		followingDigitsCounter = 1
	}
	else
	{
		followingDigitsCounter = 0
	}

	if (booksAndDigitsSeperators[i] ~ /[A-Za-z]/)
	{
		return followingDigitsCounter
	}

	for (iAhead = i+1; iAhead<=length(booksAndDigits); ++iAhead)
	{
		if (booksAndDigits[iAhead] ~ /[[:digit:]]/ && booksAndDigits[iAhead] !~ /[A-Za-z]/) #the last one is nessary because you don't want to consider the 1 in "1 Cor" to be a digit
		{
			++followingDigitsCounter;
			if (booksAndDigitsSeperators[iAhead] ~ /[A-Za-z]/)
			{
				break;
			}

		}
		else
		{
			break;
		}
	}
	if (followingDigitsCounter == 0)
	{
		print "Error: no numbers follow booksAndDigits["i"] == (" booksAndDigits[i]"); This shouldn't happen."; exit 6
	}
	
	return followingDigitsCounter
}

{


	patsplit($0, booksAndDigits, bookRegexCombined"|([[:digit:]]+(\\s*[,.])?)|(\\<ch(ap[^i])?\\.?\\W)|(\\<ver\\.?\\W)", booksAndDigitsSeperators) #fields are bookRegex, digits, "chap" "ch" or "ch\." (the \W is anything that is not a word character is the word boundary


			toPrint = substr($0, 1, index($0, booksAndDigits[1])-1); #grab everything up to the first match

			for (i=1; i<=length(booksAndDigits); ++i)
			{

			toPrint = toPrint booksAndDigits[i] booksAndDigitsSeperators[i]

			if (booksAndDigits[i] ~ verseRegex) #all numbers following need to refer to the verse of the current book
			{
			++i
			while (i in booksAndDigits) #have to add all the numbers
			{


			if (booksAndDigits[i] ~ /[[:digit:]]/)
			{
			match(booksAndDigits[i],/([[:digit:]]+)/,matchArray) 

#FOR TESTING ONLY, have to add the proper book
				toPrint = toPrint "<a href='currentBook.xhtml#CurrentBookCurrentChapter_"matchArray[1]"'>"booksAndDigits[i]"</a>" booksAndDigitsSeperators[i] #TEST: change the CurrentChapter to the actual current chapter variable in the proper program
				++i
			}
			else
			{
				break;
			}

			}
			}
			else if (booksAndDigits[i] ~ chapterRegex) #it's a chapter (ch.) followed by some number of numbers (presumably).
			{
				++i
					while (i in booksAndDigits && booksAndDigits[i] ~ /[[:digit:]]/ && booksAndDigits[i] !~ bookRegexCombined)
					{

						followingDigitsCounter = getNumberOfDigitsProceedingInBooksAndDigits(i)
#first find how many number groups follow the chapter, should be an even number because each is a chapter and a verse 


							if (followingDigitsCounter % 2 == 0) #we are assuming that it's: ch. chapter. verse. chapter. verse etc.
							{



#now we actually modify the verse:

								for (j = 1; j <= followingDigitsCounter; j += 2)
								{

									match(booksAndDigits[i+j-1],/([[:digit:]]+)/,matchArray)
										chapter = matchArray[1]
										match(booksAndDigits[i+j],/([[:digit:]]+)/,matchArray)
										verse = matchArray[1]
										toPrint = toPrint "<a href='currentBook.xhtml#CurrentBook"chapter"_"verse"'>"booksAndDigits[i+j-1]""booksAndDigitsSeperators[i+j-1]""booksAndDigits[i+j]"</a>" booksAndDigitsSeperators[i+j]  #TEST: For testing only: put in the proper xhtml and everything
								}

								i += followingDigitsCounter;
							}
							else if (followingDigitsCounter > 2)
							{
#START WORK HERE 1.2: Deal with odd numbers greater than 2 following a chapter
								print "Error: an odd number of digits follows a chapter marker. Perhaps this is one chapter and the rest of the numbers are digits. You may wish to anticipate this case and plan accordingly instead of throwing an error like now. The line in question is: " $0; next #TEST: this should be exit, not next
							}
							else #just one number following a chapter regex
							{
								match(booksAndDigits[i],/([[:digit:]]+)/,matchArray)
									chapter = matchArray[1]
									trailingAfterChapter = substr(booksAndDigits[i], length(chapter)+1)
									toPrint = toPrint "<a href='CurrentBook.xhtml#CurrentBook"chapter"_0'>"booksAndDigits[i]"</a>" booksAndDigitsSeperators[i] #TEST: change this in the proper program

									++i
							}
					}

				--i #we have to substract one, because if we're out of the while loop then we've overshot (see the two lines directly above)
			}
			else if (!(booksAndDigits[i] ~ /Heb\./ && booksAndDigitsSeperators[i] ~ /[A-Za-z]/)) #gotta find what book it is
			{


				theBook = getBookNameFromBookRegex(booksAndDigits[i])

					++i #now lets go to the numbers
					do
					{

						followingDigitsCounter = getNumberOfDigitsProceedingInBooksAndDigits(i)



							if (followingDigitsCounter % 2 == 0)
							{
								for (j=1; j<=followingDigitsCounter; j+=2)
								{
									if (!((i+j) in booksAndDigits))
									{
										print "FATAL ERROR: something is completely broken."; exit 8
									}


									match(booksAndDigits[i+j-1],/([[:digit:]]+)/,matchArray)
										chapter = matchArray[1]
										match(booksAndDigits[i+j],/([[:digit:]]+)/,matchArray)
										verse = matchArray[1]

										toPrint = toPrint "<a href='"bookFiles[theBook]"#"verseLabels[theBook]""chapter"_"verse"'>"booksAndDigits[i+j-1]""booksAndDigitsSeperators[i+j-1]""booksAndDigits[i+j]"</a>" booksAndDigitsSeperators[i+j]
								}
								i+=followingDigitsCounter
							} 
							else if (followingDigitsCounter > 2)
							{

#START WORK HERE 1.1: deal with odd numbers greater than two following a book name
								print "Error: an odd number of digits follows a book name. Perhaps this is one chapter and the rest of the numbers are digits. You may wish to anticipate this case and plan accordingly instead of throwing an error like now. The line in question is: " $0; next #TEST: this should be exit, not next

							}
							else #it's just one number after the biblical name
							{
								match(booksAndDigits[i],/([[:digit:]]+)/,matchArray)
									chapter = matchArray[1]
									trailingAfterChapter = substr(booksAndDigits[i], length(chapter)+1)


									toPrint = toPrint "<a href='"bookFiles[theBook]"#"verseLabels[theBook]""chapter"_0'>"chapter"</a>" trailingAfterChapter booksAndDigitsSeperators[i]
									++i
							}
					} while (i in booksAndDigits && booksAndDigits[i] ~ /[[:digit:]]/ && booksAndDigits[i] !~ bookRegexCombined)
					--i #have to substract one because of overshoot do to the increments of i in the foregoing if statement block
			}




			}
	print toPrint

}
