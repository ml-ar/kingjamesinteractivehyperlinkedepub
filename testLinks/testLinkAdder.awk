BEGIN {

	OFS = ""

#bookRegex holds the regexes for the book, which should match the text of a marginal reference.

#Old testament
		bookRegex["Genesis"] = "(Gen\\.?)"
		bookRegex["Exodus"] = "(Ex\\.?)"
		bookRegex["Leviticus"] = "(Lev\\.?)"
		bookRegex["Numbers"] = "(Num\\.?)"
		bookRegex["Deuteronomy"] = "(Deut\\.?)"
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
		verseLabels["Numbers"] = "NU"
		verseLabels["Deuteronomy"] = "DT"
		verseLabels["Joshua"] = "JS"
		verseLabels["Judges"] = "JG"
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
		verseLabels["Job"] = "JB"
		verseLabels["Psalms"] = "PS"
		verseLabels["Proverbs"] = "PR"
		verseLabels["Ecclesiastes"] = "EC"
		verseLabels["Song of Solomon"] = "SS"
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


		verseLabels["The Wisdom of Solomon"] = "WS"
		verseLabels["Wisdom of Solomon"] = verseLabels["The Wisdom of Solomon"]
		verseLabels["Wisdom"] = verseLabels["The Wisdom of Solomon"]


		verseLabels["Sirach"] = "SR"
		verseLabels["Ecclesiasticus"] = verseLabels["Sirach"] #sirach and ecclesiasticus is the same
		verseLabels["Baruch"] = "BR"


		verseLabels["The Song of the Three Holy Children"] = "PA"
		verseLabels["3 Holy Children's Song"] = verseLabels["The Song of the Three Holy Children"]
		verseLabels["Song of the 3 Holy Children"] = verseLabels["The Song of the Three Holy Children"]
		verseLabels["Song of the Three Holy Children"] = verseLabels["The Song of the Three Holy Children"]
		verseLabels["The Prayer of Azariah"] = verseLabels["The Song of the Three Holy Children"]
		verseLabels["Prayer of Azariah"] = verseLabels["The Song of the Three Holy Children"]

		verseLabels["Susanna"] = "SN"

		verseLabels["Bel and the Dragon"] = "BL"
		verseLabels["The Idol Bel and the Dragon"] = verseLabels["Bel and the Dragon"]


		verseLabels["The Prayer of Manasses"] = "PN"
		verseLabels["Prayer of Manasses"] = verseLabels["The Prayer of Manasses"]
		verseLabels["The Prayer of Manasseh"] = verseLabels["The Prayer of Manasses"]
		verseLabels["Prayer of Manasseh"]= verseLabels["The Prayer of Manasses"]


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
		verseLabels["Titus"] = "TT"
		verseLabels["Philemon"] = "PM"
		verseLabels["Hebrews"] = "HB"
		verseLabels["James"] = "JM"
		verseLabels["1 Peter"] = "P1"
		verseLabels["2 Peter"] = "P2"
		verseLabels["1 John"] = "1JN"
		verseLabels["2 John"] = "2JN"
		verseLabels["3 John"] = "3JN"
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

#Apocrypha

		bookFiles["1 Esdras"] = "1ES.xhtml"
		bookFiles["2 Esdras"] = "2ES.xhtml"
		bookFiles["Tobit"] = "TOB.xhtml"
		bookFiles["Judith"] = "JDT.xhtml"
		bookFiles["Esther (Greek)"] = "ESG.xhtml"

		bookFiles["The Wisdom of Solomon"] = "WIS.xhtml"
		bookFiles["Wisdom of Solomon"] = bookFiles["The Wisdom of Solomon"]
		bookFiles["Wisdom"] = bookFiles["The Wisdom of Solomon"]

		bookFiles["Sirach"] = "SIR.xhtml"
		bookFiles["Ecclesiasticus"] = bookFiles["Sirach"]

		bookFiles["Baruch"] = "BAR.xhtml"
		bookFiles["Letter of Jeremiah"] = bookFiles["Baruch"]
		bookFiles["The Letter of Jeremiah"] = bookFiles["Baruch"]
		bookFiles["The Epistle of Jeremy"] = bookFiles["Baruch"]
		bookFiles["Epistle of Jeremy"] = bookFiles["Baruch"]


		bookFiles["The Song of the Three Holy Children"] = "S3Y.xhtml"
		bookFiles["3 Holy Children's Song"] = bookFiles["The Song of the Three Holy Children"]
		bookFiles["Song of the 3 Holy Children"] = bookFiles["The Song of the Three Holy Children"]
		bookFiles["Song of the Three Holy Children"] = bookFiles["The Song of the Three Holy Children"]
		bookFiles["The Prayer of Azariah"] = bookFiles["The Song of the Three Holy Children"]
		bookFiles["Prayer of Azariah"] = bookFiles["The Song of the Three Holy Children"]



		bookFiles["Susanna"] = "SUS.xhtml"

		bookFiles["The Idol Bel and the Dragon"] = "BEL.xhtml"
		bookFiles["Bel and the Dragon"] = bookFiles["The Idol Bel and the Dragon"]

		bookFiles["The Prayer of Manasses"] = "MAN.xhtml"
		bookFiles["Prayer of Manasses"] = bookFiles["The Prayer of Manasses"]
		bookFiles["The Prayer of Manasseh"] = bookFiles["The Prayer of Manasses"]
		bookFiles["Prayer of Manasseh"]= bookFiles["The Prayer of Manasses"]

		bookFiles["1 Maccabees"] = "1MA.xhtml"
		bookFiles["2 Maccabees"] = "2MA.xhtml"


#NewTestament
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



		oneChapterBooks["Obadiah"] = "ja"
		oneChapterBooks["2 John"] = "ja"
		oneChapterBooks["3 John"] = "ja"
		oneChapterBooks["Jude"] = "ja"
		oneChapterBooks["Philemon"] = "ja"
		oneChapterBooks["Letter of Jeremiah"] = bookFiles["Baruch"]
		oneChapterBooks["The Letter of Jeremiah"] = bookFiles["Baruch"]
		oneChapterBooks["The Epistle of Jeremy"] = bookFiles["Baruch"]
		oneChapterBooks["Epistle of Jeremy"] = bookFiles["Baruch"]


		oneChapterBooks["The Song of the Three Holy Children"] = "S3Y.xhtml"
		oneChapterBooks["3 Holy Children's Song"] = oneChapterBooks["The Song of the Three Holy Children"]
		oneChapterBooks["Song of the 3 Holy Children"] = oneChapterBooks["The Song of the Three Holy Children"]
		oneChapterBooks["Song of the Three Holy Children"] = oneChapterBooks["The Song of the Three Holy Children"]
		oneChapterBooks["The Prayer of Azariah"] = oneChapterBooks["The Song of the Three Holy Children"]
		oneChapterBooks["Prayer of Azariah"] = oneChapterBooks["The Song of the Three Holy Children"]


		oneChapterBooks["Bel and the Dragon"] = "BEL.xhtml"
		oneChapterBooks["The Idol Bel and the Dragon"] = "BEL.xhtml"

		oneChapterBooks["The Prayer of Manasses"] = "MAN.xhtml"
		oneChapterBooks["Prayer of Manasses"] = oneChapterBooks["The Prayer of Manasses"]
		oneChapterBooks["The Prayer of Manasseh"] = oneChapterBooks["The Prayer of Manasses"]
		oneChapterBooks["Prayer of Manasseh"] = oneChapterBooks["The Prayer of Manasses"]









		chapterRegex = "\\<ch(apt)?\\.?" #there are two notes that are chapt, so you need what's in the parenthesis
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


#Special cases come first
/Ex\.\s+7,\s+8,\s+9,\s+/ { #Ex. 7, 8, 9, 10, 12, &c 14, chapters.

toReturn = gensub(/\s+7,\s+/, " <a href='"bookFiles["Exodus"]"#7_0'>7</a>, ", "1")
toReturn = gensub(/\s+8,\s+/, " <a href='"bookFiles["Exodus"]"#8_0'>8</a>, ", "1", toReturn)
toReturn = gensub(/\s+9,\s+/, " <a href='"bookFiles["Exodus"]"#9_0'>9</a>, ", "1", toReturn)
toReturn = gensub(/\s+10,\s+/, " <a href='"bookFiles["Exodus"]"#10_0'>10</a>, ", "1", toReturn)
toReturn = gensub(/\s+12,\s+/, " <a href='"bookFiles["Exodus"]"#12_0'>12</a>, ", "1", toReturn)
toReturn = gensub(/\s+14,\s+/, " <a href='"bookFiles["Exodus"]"#14_0'>14</a>, ", "1", toReturn)
print toReturn;
next;
}


{
	toReturn = ""


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

								match(booksAndDigits[i],/([[:digit:]]+)/,matchArray)
								chapter = matchArray[1]
								if (followingDigitsCounter<=0)
								{
									print "FATAL ERROR: No numbers proceed the symbol " booksAndDigits[i] " in " $0; exit 1
								}
								else if (followingDigitsCounter == 1) #just one number following the chapter designation
								{

									trailingAfterChapter = substr(booksAndDigits[i], length(chapter)+1)
										toPrint = toPrint "<a href='CurrentBook.xhtml#CurrentBook"chapter"_0'>"chapter"</a>" trailingAfterChapter booksAndDigitsSeperators[i] #TEST: change this in the proper program

										++i

								}
								else if (followingDigitsCounter == 2) #first number is the chapter, the next is a verse
								{
									match(booksAndDigits[i+1],/([[:digit:]]+)/,matchArray)
										verse = matchArray[1]
										trailingAfterVerse = substr(booksAndDigits[i+1], length(verse)+1)
										toPrint = toPrint "<a href='currentBook.xhtml#CurrentBook"chapter"_"verse"'>"booksAndDigits[i]""booksAndDigitsSeperators[i]""verse"</a>" trailingAfterVerse booksAndDigitsSeperators[i+1]  #TEST: For testing only: put in the proper xhtml and everything
										i += 2


								}
								else #the first number is the chapter, the rest are verses
								{

									toPrint = toPrint booksAndDigits[i] booksAndDigitsSeperators[i]
										for (j = i+1; j < i + followingDigitsCounter; ++j)
										{
											match(booksAndDigits[j],/([[:digit:]]+)/,matchArray)
												verse = matchArray[1]
												trailingAfterVerse = substr(booksAndDigits[j], length(verse)+1)
												toPrint = toPrint "<a href='CurrentBook.xhtml#CurrentBook"chapter"_"verse"'>"verse"</a>" trailingAfterVerse booksAndDigitsSeperators[j] #TEST: change this in the proper program
										}
									i += followingDigitsCounter
								}

						}

					--i #we have to substract one, because if we're out of the while loop then we've overshot (see the two lines directly above)
				}
				else if (!(booksAndDigits[i] ~ /Heb\./ && booksAndDigitsSeperators[i] ~ /[A-Za-z]/)) #gotta find what book it is
				{

					theBook = getBookNameFromBookRegex(booksAndDigits[i])

						if (!(theBook in verseLabels))
						{
							print "ERROR: could not find " theBook " in the verseLabels array."; exit 2
						}
					if (!(theBook in bookFiles))
					{
						print "ERROR: could not find " theBook " in the bookFiles array."; exit 3
					}
					++i #now lets go to the numbers
						do
						{


							followingDigitsCounter = getNumberOfDigitsProceedingInBooksAndDigits(i)
#START WORK HERE 1: Fill in if statements with appropriate values
#make sure Rev. 1 13, 14, 15 is not parsed as Revelation 1:13 and Revelation 14:15!
								if (followingDigitsCounter <= 0)
								{
									print "FATAL ERROR: No numbers proceed the symbol " booksAndDigits[i] " in " $0; exit 1
								}
								else if (theBook in oneChapterBooks) #every number points to a verse
								{
									for (j = i; j < i + followingDigitsCounter; ++j)
									{
										match(booksAndDigits[j],/([[:digit:]]+)/,matchArray)
											verse = matchArray[1]
											trailingAfterVerse = substr(booksAndDigits[j], length(verse)+1)
											toPrint = toPrint "<a href='"bookFiles[theBook]"#"verseLabels[theBook]"1_"verse"'>"verse"</a>" trailingAfterVerse booksAndDigitsSeperators[j]
									}
									i += followingDigitsCounter

								}
								else if (followingDigitsCounter > 2) #first number is a chapter, the rest are verses in that chapter
								{
									toPrint = toPrint booksAndDigits[i] booksAndDigitsSeperators[i]

										match(booksAndDigits[i],/([[:digit:]]+)/,matchArray)
										chapter = matchArray[1]

										for (j = i+1; j < i + followingDigitsCounter; ++j)
										{
											match(booksAndDigits[j],/([[:digit:]]+)/,matchArray)
												verse = matchArray[1]
												if (theBook ~ /Esther/)
												{
													if (chapter > 10)
													{
														theBook = "Esther (Greek)"
													}
													else if (chapter == 10 && verse > 3)
													{
														theBook = "Esther (Greek)"
													}
													else
													{
														theBook = "Esther"
													}

												}
											trailingAfterVerse = substr(booksAndDigits[j], length(verse)+1)
												toPrint = toPrint "<a href='"bookFiles[theBook]"#"verseLabels[theBook]""chapter"_"verse"'>"verse"</a>" trailingAfterVerse booksAndDigitsSeperators[j]


										}

									i += followingDigitsCounter
								}
								else if (followingDigitsCounter == 2) #first number is a chapter, the rest is a verse (START WORK HERE 1.1), DON'T FORGET ESTHER SPECIAL CASE
								{
								}
								else #just one number follows the book (START WORK HERE 1.2) DON'T FORGET ESTHER SPECIAL CASE
								{
								}



						} while (i in booksAndDigits && booksAndDigits[i] ~ /[[:digit:]]/ && booksAndDigits[i] !~ bookRegexCombined)
						--i #have to substract one because of overshoot do to the increments of i in the foregoing if statement block
				}
				else
				{
					print "Unexpected case for booksAndDigits["i"] = " booksAndDigits[i] "."; exit 2
				}




				}
	print "\n" toPrint

}
