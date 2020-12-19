#this program takes all processed footnotes in an xhtml (<span class="ft">footnote text</span>) and makes hyperlinks for cross references:

#for example:

#<span class="ft">Ps. 33. 6. &amp; 136. 5. Acts 14. 15. &amp; 17. 24. Heb. 11. 3.</span>

#should become:

#<span class="ft"><li><a href='PSA.xhtml#PS33_6'>Ps. 33. 6.</a></li> &amp; <li><a href='PSA.xhtml#PS136_5'>136. 5.</a></li> <li><a href='ACT.xhtml#AC14_15'>Acts 14. 15.</a></li> &amp; <li><a href='ACT.xhtml#AC17_24'>Acts 17. 24.</a></li> <li><a href='HEB.xhtml#HB11_3'>Heb. 11. 3.</a></li></span>

#EXIT CODES:
#1: Could not match the end of the line and chapter and verse of the footnote label at the end
#2: Could not parse out exactly the chapter and verse from the footnote label at the end
#3: Could not get the current book from the XHTML
#4: The program could not parse the footnote text
BEGIN {


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



		chapterRegex = "ch\\.?"
		verseRegex = "ver\\.?"












}


/a href='index.xhtml'/ {

	match($0,/<li>\s*<a href='index.xhtml'>\s*([^<\n]+)<\/a>\s*<\/li>/, matchArray)

		if (!(1 in matchArray))
		{
			print "Error parsing the current book."; exit 3
		}


#Error checking

	if (!(matchArray[1] in bookRegex))
	{
		print "Did not find the book " matchArray[1] " in the bookRegex array. Did you anticipate this?" | "cat 1>&2"
	}

	if (!(matchArray[1] in verseLabels))
	{
		print "Did not find the book " matchArray[1] " in the verseLabels array. Did you anticipate this?" | "cat 1>&2"
	}

	currentBook = matchArray[1]
}


/<aside epub:type='footnote'/ {

if (!match($0, /([[:digit:]]+)\s*\.\s*([[:digit:]]+)\s*<\/a>\s*$/, matchArray))
{
	print "Error matching chapter and verse in epub label."; exit 1
}

if (!(1 in matchArray) || !(2 in matchArray))
{
print "Error matching the numbers of the chapter and verse exactly in the epub label."; exit 2;
}

currentChapter = matchArray[1]
currentVerse = matchArray[2]

}


/<span class="ft">/ {

#remember that if it's "ch" it refers to the book in question

#first match the footnote text
	if (!match($0,/<span class="ft">(.+)<\/span>/, matchArray))
	{
		print "Error getting the whole footnote text."; exit 4
	}

	if (!(1 in matchArray))
	{
		print "Error getting the whole footnote text."; exit 4
	}

	if (matchArray[1] !~ /[[:digit:]]/) #we need digits, so if not , just print and go to the next line
	{
		print $0; next;
	}


#START WORK HERE: matchArray[1] properly holds the footnote text (including <span class='add'>). Now have to parse it down into constituent parts
#Don't forget that &amp; can be followed by a c (e.g., &amp;c. (maybe the c has a period after it!))


#split based on: ampersands, spans (obviously),

patsplit(matchArray[1], booksAndDigits, bookRegexCombined"|([[:digit:]]+(\\s*[,.])?)|(\\<ch(ap[^i])?\\.?\\W)|(\\<ver\\.?\\W)", booksAndDigitsSeperators) #fields are bookRegexes, digits, "chap" "ch" or "ch\." (the \W is anything that is not a word character is the word boundary

#START WORK HERE: The patsplit seems to split the first Genesis note okay, test the rest
#important to note that you have to print the whole line from the beginning up to booksAndDigits[1], because booksAndDigits[1] can be somewhere in the middle of split string

#also look at line 285: deut is lowercase!!!










#make sure that "add" spans are proprely captured and printed 

#Tricky ones:
#Lev. 26. 26. ch. 4. 16. &amp; 5. 16. #This is: Levit 26:26, Levit 4:16 & Levit 5:16
#Ex. 7, 8, 9, 10, 12, &amp; 14, chapters. #these are all chapter names
#Or, <span class="add">ward,</span> or, <span class="add">ordinance:</span> and so ver. 14. &amp; 16. #you want to make sure ver. 14 and ver.16 have tags
#Num. 18. 20. Deut. 10 9. &amp; 18 1, 2. Josh. 13. 14, 33. # Num 18:20, Deut 10:9 & Deut 18:1 Deut 18:2, Josh 13:14, Josh 13:33
#See Num. 28, &amp; 39. Ex. 23. 19. Lev. 19. 23. #make sure you can get the "num" even though there's a "See"
#Called, Luke 3. 35, <span class="add">Phalec.</span> #want to make sure luke is captured as well
#Heb. thigh. , Gen.46. 27. deut. 10.22. #heb is the book of hebrews, don't want to match that; fortunately these are probably contained in two different footnotes, so it might not even be a problem
#ch. 5. 1. &amp; 9. 6. 1 Cor. 11. 7. Eph. 4. 24. Col. 3. 10. #not terribly tricky, but make sure you split right
#ch. 18. 18. &amp; 22. 18. Acts 3. 25. Gal. 3. 8. #same as above
#Ps. 33. 6. &amp; 136. 5. Acts 14. 15. &amp; 17. 24. Heb. 11. 3. #again same as the obove
#ver. 56. &amp; 59. #get verse working
#ch. 12. 3. &amp; 15. 18. &amp; 22. 18. #get chapter working
#ch. 16. 14. &amp; 25. 11.
#footnote_nt10852 (text is simply "Jude 9.")



#print the appropriate line
	next;
}






{
print $0;
}
