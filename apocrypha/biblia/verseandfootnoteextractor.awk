#for an input html (e.g., Genesis 1-1.hmtml), this program outputs the following tab-seperated data:


#good input file is: 1-esdras 1-4.xhtml
#also important to test for bel and the dragon and sirach prologue

#book	chapter	verse	full verse text (italics are surrounded thus <i>text</i>)	footnote symbol	footnote text	preceding verse text (italics preserved)

#the last four can be repeated for as many footnotes as necessary
#if chapter is 0, that means it's just verses





#ERROR CODES
#1: Could not find the relevant line that has the whole text
#2: Could not find the text header tag in the xhtml
#3: Could not extract the footnote symbol after a footnote tag
#4: The footnote text finding function could not find the footnote text location


#just like gensub, except it works on literals instead of regexes
function literalgensub(literalPattern, literalSubstitution, number, string,  toReturn,  position,  mutilatedString,  matchArray,  i)
{

	toReturn = ""


	mutilatedString = string

		if (!match(number,/^[Gg]/) && !match(number,/^[[:digit:]]+/))
		{
			number = 1
		}


	if (!(position = index(string, literalPattern)))
	{
		return string;
	}


	if (match(number,/^[Gg]/)) #replace all
	{
		while (position = index(mutilatedString, literalPattern))
		{
			toReturn = toReturn substr(mutilatedString, 1, position-1)
				toReturn = toReturn literalSubstitution
				mutilatedString = substr(mutilatedString, position+length(literalPattern))
		}
	}
	else if (match(number,/^([[:digit:]]+)/, matchArray))
	{
		for (i = 0; i < matchArray[0]; ++i)
		{
			position = index(mutilatedString, literalPattern)
				toReturn = toReturn substr(mutilatedString, 1, position-1)
				toReturn = toReturn literalSubstitution
				mutilatedString = substr(mutilatedString, position+length(literalPattern))
		}
	}
       else
       {
	       print "ERROR: literalgensub bug, could not find the number of iterations."; exit 17;
       }
	toReturn = toReturn mutilatedString

		return toReturn;


}





BEGIN {
	RS = "^$"
		OFS = "\t" #setting it to tab


#a map between book name and xhtml files
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

#All linked footnotes have a href like "#href="/reference/Eze28.13?resourceName=av1873". So for "Ezekiel" bibliaAbbrev["Eze"] would be "Ezekiel". The abbreviation is the element (for fast lookup)

		bibliaAbbrev["Ge"] = "Genesis"
		bibliaAbbrev["Ex"] = "Exodus"
		bibliaAbbrev["Le"] = "Leviticus"
		bibliaAbbrev["Nu"] = "Numbers"
		bibliaAbbrev["Dt"] = "Deuteronomy"
		bibliaAbbrev["Jos"] = "Joshua"
		bibliaAbbrev["Jdg"] = "Judges"
		bibliaAbbrev["Ru"] = "Ruth"
		bibliaAbbrev["1Sa"] = "1 Samuel"
		bibliaAbbrev["2Sa"] = "2 Samuel"
		bibliaAbbrev["1Ki"] = "1 Kings"
		bibliaAbbrev["2Ki"] = "2 Kings"
		bibliaAbbrev["1Ch"] = "1 Chronicles"
		bibliaAbbrev["2Ch"] = "2 Chronicles"
		bibliaAbbrev["Ezr"] = "Ezra"
		bibliaAbbrev["Ne"] = "Nehemiah"
		bibliaAbbrev["Es"] = "Esther"
		bibliaAbbrev["Job"] = "Job"
		bibliaAbbrev["Ps"] = "Psalms"
		bibliaAbbrev["Pr"] = "Proverbs"
		bibliaAbbrev["Ec"] = "Ecclesiastes"
		bibliaAbbrev["So"] = "Song of Solomon"
		bibliaAbbrev["Is"] = "Isaiah"
		bibliaAbbrev["Je"] = "Jeremiah"
		bibliaAbbrev["La"] = "Lamentations"
		bibliaAbbrev["Eze"] = "Ezekiel"
		bibliaAbbrev["Da"] = "Daniel"
		bibliaAbbrev["Ho"] = "Hosea"
		bibliaAbbrev["Joe"] = "Joel"
		bibliaAbbrev["Am"] = "Amos"
		bibliaAbbrev["Ob"] = "Obadiah"
		bibliaAbbrev["Jon"] = "Jonah"
		bibliaAbbrev["Mic"] = "Micah"
		bibliaAbbrev["Na"] = "Nahum"
		bibliaAbbrev["Hab"] = "Habakkuk"
		bibliaAbbrev["Zep"] = "Zephaniah"
		bibliaAbbrev["Hag"] = "Haggai"
		bibliaAbbrev["Zec"] = "Zechariah"
		bibliaAbbrev["Mal"] = "Malachi"
		bibliaAbbrev["1Esd"] = "1 Esdras"
		bibliaAbbrev["2Esd"] = "2 Esdras"
		bibliaAbbrev["Tob"] = "Tobit"
		bibliaAbbrev["Jdt"] = "Judith"
		bibliaAbbrev["Es"] = "Esther"
		bibliaAbbrev["Wis"] = "Wisdom of Solomon"
		bibliaAbbrev["Sir"] = "Sirach"
		bibliaAbbrev["Bar"] = "Baruch"


#multiple names
		bibliaAbbrev["SongThr"] = "Song of the 3 Holy Children"

		bibliaAbbrev["Sus"] = "Susanna"
#multiple names
		bibliaAbbrev["Bel"] = "Bel and the Dragon"
#multiple names
		bibliaAbbrev["PrMan"] = "Prayer of Manasseh"

		bibliaAbbrev["1Mac"] = "1 Maccabees"
		bibliaAbbrev["2Mac"] = "2 Maccabees"
		bibliaAbbrev["Mt"] = "Matthew"
		bibliaAbbrev["Mk"] = "Mark"
		bibliaAbbrev["Lk"] = "Luke"
		bibliaAbbrev["Jn"] = "John"
		bibliaAbbrev["Ac"] = "Acts"
		bibliaAbbrev["Ro"] = "Romans"
		bibliaAbbrev["1Co"] = "1 Corinthians"
		bibliaAbbrev["2Co"] = "2 Corinthians"
		bibliaAbbrev["Ga"] = "Galatians"
		bibliaAbbrev["Eph"] = "Ephesians"
		bibliaAbbrev["Php"] = "Philippians"
		bibliaAbbrev["Col"] = "Colossians"
		bibliaAbbrev["1Th"] = "1 Thessalonians"
		bibliaAbbrev["2Th"] = "2 Thessalonians"
		bibliaAbbrev["1Ti"] = "1 Timothy"
		bibliaAbbrev["2Ti"] = "2 Timothy"
		bibliaAbbrev["Tt"] = "Titus"
		bibliaAbbrev["Phm"] = "Philemon"
		bibliaAbbrev["Heb"] = "Hebrews"
		bibliaAbbrev["Jas"] = "James"
		bibliaAbbrev["1Pe"] = "1 Peter"
		bibliaAbbrev["2Pe"] = "2 Peter"
		bibliaAbbrev["1Jn"] = "1 John"
		bibliaAbbrev["2Jn"] = "2 John"
		bibliaAbbrev["3Jn"] = "3 John"
		bibliaAbbrev["Jud"] = "Jude"
		bibliaAbbrev["Re"] = "Revelation"

#two letter verse prefixes in the epub xhtmls
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




}


#swaps all <em> html tags (which signify italics) to the proper 'add' tag for italics in the epub
function convertItalics(htmlTag) #NOT TESTED
{
htmlTag = gensub(/<em>/,"<span class='add'>","g",htmlTag)
htmlTag = gensub(/<\/em>/,"</span>","g",htmlTag)
return htmlTag;
}



#function takes a bibliatag and returns the proper EPUB hyperlink begining
#e.g: bibliatag is something in the form like <a data-reference="Zec1.17" data-datatype="bible+kjv" href="/reference/Zec1.17?resourceName=av1873" class="bibleref"> or <a data-reference="Jud9" data-datatype="bible+kjv" href="/reference/Jud9?resourceName=av1873" class="bibleref">
#And the function will return: <a href='ZEC.xhtml#ZC1_17'> and <a href='JUD.xhtml#JD1_9'>


function getProperHyperlinkOpeningBracket(bibliaTag,  hyperlinkArray,  linkBook,  linkBookFullName,  linkChapter,  linkVerse,  toReturn)
{

	if (!(match(bibliaTag,/^\s*<a data-reference="([^"]+)"[^>]+>*$/, hyperlinkArray)))
	{
		print "ERROR: Could not parse " bibliaTag " into a hyperlink tag."; exit 6
	}

	match(hyperlinkArray[1], /([[:digit:]]?[A-Za-z]+)([[:digit:]]+)(\.([[:digit:]]+))?/, hyperlinkArray)
		linkBook = hyperlinkArray[1]

		linkChapter = hyperlinkArray[2]

		if (!(4 in hyperlinkArray) || !hyperlinkArray[4]) #4 is the index for the inner parenthesis in the right most of the regex in the most recent match
		{
			linkVerse = 0
		}
		else
		{
			linkVerse = hyperlinkArray[4]
		}

	if (!(linkBook in bibliaAbbrev))
	{
		print "ERROR: inferred book " linkBook " from " bibliaTag " is not in the bibliaAbbrev array."; exit 7
	}

	linkBookFullName = bibliaAbbrev[linkBook]

		if (!(linkBookFullName in bookFiles))
		{
			print "ERROR: book " linkBookFullName " is not in the bookFiles array."; exit 8
		}

	if (!(linkBookFullName in verseLabels))
	{
		print "ERROR: book " linkBookFullName " is not in the verseLabels array."; exit 8
	}

	toReturn = "<a href='"bookFiles[linkBookFullName]"#"verseLabels[linkBookFullName]""linkChapter"_"linkVerse"'>"

		return toReturn;

}



#returns simply the text associated with the footnote number, also properly adds html tags for making hyperlinks
#footnote number: the number of the footnote AS PER THE HTML file under question (e.g. if in the html it's #footnote1, you should pass "1")
function getFootnoteText(footnoteNumber,  footnoteStart,  footnotesSplitArray,  footnotesSepsArray,  toReturn,  innerTDs,  innerA,  innerItalics,  innerSpans,  k,  t)
{
	if (!(footnoteStart = index($0,"<td id=\"footnote"footnoteNumber"\">")))
	{
		print "ERROR: Could not find #footnote"footnoteNumber ". This shouldn't happen."; exit 4
	}

	footnoteMenu = substr($0, footnoteStart) #getting the footnote section
		footnoteMenu = gensub(/\s*\n.*$/,"","g",footnoteMenu); #chopping off everything after the newline


		split(footnoteMenu, footnotesSplitArray, /<[^>]+>/, footnotesSepsArray)
		innerTDs = 0 #used for marking off how many tags we see; if we see any opening tags, we have to track them so we can add the tags appropriately to what needs to be returned
		innerA = 0
		toReturn = ""
		for (k in footnotesSplitArray)
		{
			toReturn = toReturn footnotesSplitArray[k]
#START WORK HERE 1: Sirach 3:13 footnote text does not properly parse, because there's a f superscript that's ignored
				if (footnotesSepsArray[k] ~ /<td\s+/) #we expect the first thing to be a <td; we don't add them to the string, but we track them because we need to know when to break
				{
					++innerTDs
				}
				else if (footnotesSepsArray[k] ~ /<\/td>/)
				{
					--innerTDs
						if (innerTDs == 0) #we've reached the end of the footnote block for this footnote number
						{
							break;
						}
				}
				else if (footnotesSepsArray[k] ~ /<a data-reference=/) #this is a footnote link marker; need to track it
				{
					++innerA
						toReturn = toReturn footnotesSepsArray[k]
				}
				else if (footnotesSepsArray[k] ~ /<\/a>/ && innerA > 0)
				{
					--innerA
						toReturn = toReturn footnotesSepsArray[k]

				}
				else if (footnotesSepsArray[k] ~ /<em>/) #this is an italic marker; need to track it
				{
					++innerItalics
						toReturn = toReturn footnotesSepsArray[k]
				}
				else if (footnotesSepsArray[k] ~ /<\/em>/ && innerItalics > 0)
				{
					--innerItalics
						toReturn = toReturn footnotesSepsArray[k]

				}
				else if (footnotesSepsArray[k] ~ /<span style="vertical-align:super/)
				{
					++innerSpans;
					toReturn = toReturn footnotesSepsArray[k]
				}
				else if (footnotesSepsArray[k] ~ /<\/span>/ && innerSpans > 0)
				{
					--innerSpans
						toReturn = toReturn footnotesSepsArray[k]
				}
		}


#the above is working: can properly get italic markers and the html cross reference tags


	patsplit(toReturn, footnotesSplitArray,/<a data-reference[^>]+>/, footnotesSepsArray)

		toReturn = footnotesSepsArray[0] #there might be something in the Seps array before the first patsplit (if there's anything in the footnotesSplitArray at all)

		for (t in footnotesSplitArray) #swapping out each data-reference tag with proper epub tags
		{
			toReturn = toReturn getProperHyperlinkOpeningBracket(footnotesSplitArray[t]) footnotesSepsArray[t]
		}


	patsplit(toReturn, footnotesSplitArray,/<span style="vertical-align:super[^>]+>/, footnotesSepsArray) #now we are changing the vertical-align spans into notemark spans so that in the epub they'll be properly rendered as a superscript
		toReturn = footnotesSepsArray[0] #there might be something in the Seps array before the first patsplit (if there's anything in the footnotesSplitArray at all)

		for (t in footnotesSplitArray) #swapping out each data-reference tag with proper epub tags
		{
			toReturn = toReturn "<span class=\"notemark\">" footnotesSepsArray[t]
		}


#the above loops and patsplits are minimially tested, seems to be working


	return convertItalics(gensub(/\s*$/,"","1",toReturn)); #convert to italics and delete trailing spaces

}

{

	if (!(pointer = index($0,"<a data-datatype=\"bible+kjv\" data-reference=")))
	{
		print "Error grabbing the text line."; exit 1
	}

	verseBlock = substr($0, pointer)

		if (verseBlock !~ /footnote/) #no footnote data in the current file, nothing to see here;
	{
		exit 0;
	}




	verseBlock = substr($0, pointer)
		verseBlock = gensub(/(\s*\n.*$)/,"","g",verseBlock) #the relevant part is all on one line, trim everything








		split(verseBlock, splitArray, /<[^>]+>/,sepsArray) #split by HTML tags


		precedingText = ""
		numOfFootnotes = 0

#get footnotes
#be careful distinguishing between full books (e.g. bell and the dragon) and those divided up into books and chapters


		for (i=1; i<=length(splitArray); ++i)
		{
			if (i-1 in sepsArray)
			{
				if (sepsArray[i-1] ~ /rel="popup"/ && sepsArray[i-1] ~ /href="#footnote[[:digit:]]+"/) #the previous seps is a footnote span, that means the current thing is a footnote symbol
				{
					match(sepsArray[i-1],href="#footnote([[:digit:]]+)", matchArray)
						footnoteNumber = matchArray[1]
						j = i
						while (j<=length(splitArray)) #we have to go through splits till we find the first non empty string; this is the footnote symbol
						{
							if (splitArray[j] !~ /^\s*$/ && splitArray[j] && splitArray[j] != "") #these ands might be redundant
							{
								i = j
									break; #found the index for the footnote symbol
							}
							++j;
						}

					if (j > length(splitArray))
					{
						print "FATAL ERROR: found footnote but could not properly get the footnote symbol."; exit 3;
					}
#WARNING: this could be problem, chapter might be a proper integer while verse is a string


#about to make a new entry to the footnotes array, have to trim the data
					precedingText = gensub(/[  \t]{2,}/," ","g",precedingText) #careful with the non-breaking spaces!
						precedingText = gensub(/^[\t  ]+/,"","g",precedingText) #this is probably right; you don't expect there to be any spaces to begin the preceding text
						precedingText = gensub(/[\t\n]+$/,"","g",precedingText) #this might be problematic, haven't tested
						footnoteSymbol = gensub(/\s*/,"","g",splitArray[i])
						footnotes[++numOfFootnotes][chapter][verse][precedingText][footnoteSymbol] = getFootnoteText(footnoteNumber);




					continue; #we continue, because we don't want to add the footnote symbol to the preceding text
				}

				else if (match(sepsArray[i-1], /<a data-datatype="bible\+kjv" data-reference="([^"]+)"/, matchArray)) #found the beginning marker of a verse block
				{

					if (match(matchArray[1],/\s*([[:digit:]]+)(:([[:digit:]]+))?\s*$/, matchArray2))
					{
						if (3 in matchArray2)
						{
							verse = matchArray2[3]
								chapter = matchArray2[1]
						}
						else
						{
							verse = matchArray2[1]
								chapter = 0

						}
						book = substr(matchArray[1], 1, index(matchArray[1], matchArray2[0])-1)

							if (verse != "1") #if the verse is greater than one, we expect to find a splitArray element to be just that verse; we have to skip it
							{
								j = i;
								while (j<=length(splitArray))
								{
									if (splitArray[j] ~ "^\\s*"verse"\\s*$")
									{
										i = j;
										break; #found the index for the verse number
									}
									++j;
								}
								if (j>length(splitArray))
								{
									print "FATAL ERROR: found footnote but could not properly get the footnote symbol."; exit 3;
								}
							}
					}
					else
					{

						book = matchArray[1]
							verse = 0; #probably a title
							chapter = 0;
					}


				}



			}

			if (verse && splitArray[i] ~ "^\\s*"verse"\\s*$") #this splitArray element is just the verse number; skip it
			{
				continue;
			}

			if (((oldVerse>=0 && oldChapter>=0 && book) && (chapter != oldChapter || verse != oldVerse || book != oldBook))) #there was a verse/chapter switch this loop or there's a new paragraph; we need to clear the precedingText variable, tested seems to be working (I had to add the paragraph break check because Sirach prologue won't parse properly if that's the case; this might be problematic in the case that a biblia xhtml splits a verse by a paragraph, but I don't anticipate that will happen)
			{
				precedingText = ""
			}
			else
			{
				precedingText = precedingText splitArray[i]
			}
			oldVerse = verse;
			oldChapter = chapter;
			oldBook = book;
		}



#footnotes array anatomy: footnotes[footnoteNumber][chapter][verse]["precedingWords"]["symbol"] = "actual footnote text"
#if chapter is 0, it means it's either a chapterless book or it's part of the prologue
#if chapter is 0 and verse is 0 it means it's a footnote in the title (see bel and the dragon)








}

END {
#tweak this to your pleasure

for (i in footnotes) #footnoteNumber
{
	for (j in footnotes[i]) #chapter
	{
		for (k in footnotes[i][j]) #verse
		{
			for (l in footnotes[i][j][k]) #precedingWords
			{
				for (m in footnotes[i][j][k][l]) #symbol
				{
                                print book, j, k, i, l, m, footnotes[i][j][k][l][m]
				}
			}
		}
	}
}


#It's important that you, in the next program that inserts the footnotes in their places, you properly insert the footnotes for Sirach Prologue

exit 0
}
