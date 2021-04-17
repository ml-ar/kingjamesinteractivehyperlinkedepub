#this awk program takes as an input a tab seperated file in the following form:

#Book	Chapter	Verse	Footnote number for that verse	Preceding text	footnote symbol	footnote text

#EXIT CODES
#1: Problem finding the preceding text in the Sirach prologue

BEGIN {

folderPrefix = "../../denuded epub/OEBPS/"
xhtmlEndRegex = "(<hr />\\s*\n\\s*)?</div>\\s*\n</div></body></html>(\\s*|\n)*$"


	FS = "\t"


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
		bookFiles["Song of Three Youths"] = bookFiles["The Song of the Three Holy Children"]


		bookFiles["Susanna"] = "SUS.xhtml"

		bookFiles["The Idol Bel and the Dragon"] = "BEL.xhtml"
		bookFiles["Bel and the Dragon"] = bookFiles["The Idol Bel and the Dragon"]

		bookFiles["The Prayer of Manasses"] = "MAN.xhtml"
		bookFiles["Prayer of Manasses"] = bookFiles["The Prayer of Manasses"]
		bookFiles["The Prayer of Manasseh"] = bookFiles["The Prayer of Manasses"]
		bookFiles["Prayer of Manasseh"]= bookFiles["The Prayer of Manasses"]

		bookFiles["1 Maccabees"] = "1MA.xhtml"
		bookFiles["2 Maccabees"] = "2MA.xhtml"

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
		oneChapterBooks["Song of Three Youths"] = oneChapterBooks["The Song of the Three Holy Children"]


	        oneChapterBooks["Susanna"] = "SUS.xhtml"

		oneChapterBooks["Bel and the Dragon"] = "BEL.xhtml"
		oneChapterBooks["The Idol Bel and the Dragon"] = "BEL.xhtml"

		oneChapterBooks["The Prayer of Manasses"] = "MAN.xhtml"
		oneChapterBooks["Prayer of Manasses"] = oneChapterBooks["The Prayer of Manasses"]
		oneChapterBooks["The Prayer of Manasseh"] = oneChapterBooks["The Prayer of Manasses"]
		oneChapterBooks["Prayer of Manasseh"] = oneChapterBooks["The Prayer of Manasses"]

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
		verseLabels["Song of Three Youths"] =  verseLabels["The Song of the Three Holy Children"]
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


}


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

#Apocrypha footnotes end like this:
#<div class="footnote">
#<hr />
#</div>
#</div></body></html>
#ugly! this function fixes them
#xhtmlVariable: contains a whole xhtml variable
function fixEndingHorizontalRules(xhtmlVariable,  oldFootnoteSection,  newFootnoteSection,  matchArray)
{


	if (!match(xhtmlVariable, /<div class="footnote">(\s|\n)*<hr\s*\/>(\s|\n)*.*$/, matchArray)) #nothing to do
	{
		return xhtmlVariable; 
	}

	oldFootnoteSection = matchArray[0]
		newFootnoteSection = "<div class=\"footnote\">\n<hr />\n"

		newFootnoteSection = newFootnoteSection "<hr />\n</div>\n</div></body></html>" #closing up the section

		xhtmlVariable = literalgensub(oldFootnoteSection, newFootnoteSection, 1, xhtmlVariable)

return xhtmlVariable;

}



#same as match except returns the position of the last match
function lastMatch(stringToCheck, regex,  mutilatedString,  pointer,  lastPosition) #minimially tested, seems to be working
{
   if (!regex)
   {
    print "FATAL ERROR: empty regex passed to function lastMatch. This was the string to check: \n" stringToCheck
    exit 1
   }
	mutilatedString = stringToCheck;
	pointer = 1;
	while (lastPosition = match(mutilatedString, regex))
	{
		mutilatedString = substr(mutilatedString, ++lastPosition)
			pointer += lastPosition - 1

	}
	return pointer-1;
}

#adds the "<aside epud:type='footnote'>\n"<span class <ft>" at the end of the xhtmlVariable (an xhtml file) in the appropriate place
#xhtmlVariable: the full text of the xhtmlfile to modify
#the tag to add
#returns the modified xhtml variable
function addFootnoteTagsAtBottom(xhtmlVariable, tagToAdd,  matchArray)
{

	if (!match(xhtmlVariable, /<hr \/>\s*\n\s*<\/div>\s*\n<\/div><\/body><\/html>$/, matchArray))
	{
		print "Error finding the footnotes section at the end of the xhtmlVariable."; exit 7;
	}

		xhtmlVariable = literalgensub(matchArray[0], tagToAdd matchArray[0], 1, xhtmlVariable)

		return xhtmlVariable;

}


#returns the new xhtmlVariable
#xhtmlVariable: the xhtmlVariable to insert
#line header: a regex to describe the span that demarcates the beginning of the line (since we can rely on the usual chapter_verse designation thing); if left blank, defaults to <div class='mt'>
#returns appropriately modified xhtmlVariable
function insert0and0(xhtmlVariable, book,  lineHeader,  modifiedVerse,  newFootnoteSection,  i,  j,  k,  matchArray)
{

	if (!lineHeader)
	{
		lineHeader =  "<div class='mt'>"
	}

	lineHeader = lineHeader "[^\n]+\n"

		if (!(book in footnotes))
		{
			print "ERROR: could not find " book " in the footnotes array."; exit 5
		}



	for (i in footnotes[book][0][0]) #footnotenumber
	{
		for (j in footnotes[book][0][0][i]) #precedingText
		{
			for (k in footnotes[book][0][0][i][j]) #footnoteSymbol
			{

				if (!match(xhtmlVariable, lineHeader, matchArray))
				{
					print "ERROR: couldn't find the title header for the book when inserting a footnote in the header."; exit 6;
				}
				modifiedVerse = getModifiedVerse(matchArray[0], j, k, i, "00"i)
					xhtmlVariable = literalgensub(matchArray[0], modifiedVerse, 1, xhtmlVariable)
					newFootnoteSection = "<aside epub:type='footnote' id=\"FN"i"\"><p class=\"f\"><a class=\"notebackref\" href=\"#00"i"\"><span class=\"notemark\">"k"</span></a>\n <span class=\"ft\">"footnotes[book][0][0][i][j][k]"</span></p></aside>\n"

					xhtmlVariable = addFootnoteTagsAtBottom(xhtmlVariable, newFootnoteSection)
			}
		}
	}

	delete footnotes[book][0][0]

		return xhtmlVariable

}

#creates an adhoc array of size one, the only index is a SINGLE book (this is to parse the footnotes array so it'll work properly with writeCSS


#book: a book title
#adhocFootnotes: the array to copy to
function copySingleBookFootnotesArray(book, adhocFootnotes,  j,  k,  l,  m,  n)
{
delete adhocFootnotes;
if (!(book in footnotes))
{
print "ERROR: could not find the book " book "in the footnotes array!"; exit 5
}

for (j in footnotes[book]) #chapter
{
for (k in footnotes[book][j]) #verse
{
for (l in footnotes[book][j][k]) #precedingVerseText
{
for (m in footnotes[book][j][k][l]) #index
{
	for (n in footnotes[book][j][k][l][m]) #footnote symbol
	{
		adhocFootnotes[book][j][k][l][m][n] = footnotes[book][j][k][l][m][n]
	}
}
}
}
}


}


#same as the index(string, in) function except returns the LAST occurence of the in in string, tested works
function lastIndex(stringToCheck, inMe,  mutilatedString,  pointer,  lastPosition)
{
   if (!inMe)
   {
    print "FATAL ERROR: empty string passed to lastIndex. This was the string to check: \n" stringToCheck
    exit 1
   }
	mutilatedString = stringToCheck;
	pointer = 1;
	while (lastPosition = index(mutilatedString, inMe))
	{
		mutilatedString = substr(mutilatedString, ++lastPosition)
			pointer += lastPosition - 1

	}
	return pointer-1;
}


#takes all the chapter footnotes indices for book that are 0 and moves them to the 1 index, then deletes the 1 index
function change0Chapterto1(footnotesArray, book,  i,  j,  k,  l)
{

	if (!(book in footnotesArray))
	{
		print "Error in function change0Chapterto1(): wrong book passed"; exit 8;
	}


#footnotes[book][chapter][verse][precedingVerseText][index][footnoteSymbol] = actualFootnoteText

	for (i in footnotesArray[book][0]) #verse
	{
		for (j in footnotesArray[book][0][i]) #precedingVerseText
		{
			for (k in footnotesArray[book][0][i][j]) #index
			{
				for (l in footnotesArray[book][0][i][j][k]) #chapter
				{
					footnotesArray[book][1][i][j][k][l] = footnotesArray[book][0][i][j][k][l]
				}
			}


		}
	}

	delete footnotesArray[book][0]

}


#filename: the file to read
#returns the complete text stored in a variable
function storeTextFileInVariable(fileName,  toReturn,  line)
{
	toReturn = ""
		while ((getline line < fileName) > 0)
		{
			toReturn=toReturn "\n" line;
		}

	return toReturn;

}



#returns fullVerseLine, but modified with the footnote symbol in the right place

#fullVerseLine: a full line (with newlines at the beginning at end), like: <span class="verse" id="C11_11">11&#160;</span> For it hath been declared unto me of you, my brethren, by them <span class='add'>which are of the house</span> of Chloe, that there are contentions among you. 
#precedingWords: the verse text before which the footnote symbol is to come
#footnoteSymbol: the symbol by which to demarcate the prescence of the note
#footnoteNumber: the number to ascribe to the footnote
#id: optional, specify the id for the footnote, useful if the footnote does not belong to any verse in particular and you want to link to it directly

function getModifiedVerse(fullVerseLine, precedingWords, footnoteSymbol, footnoteNumber, id,  toAppend,  verseTextOnly,  splitArray,  matchArray,  sepsArray,  severedSepBefore,  severedSepAfter,  found,  position,  toReturn,  o,  PREVIOUSIGNORECASE)
{
	if (id)
	{
		id = "id=\""id"\" "
	}

	if (!precedingWords || match(precedingWords,/^¶?\s*$/)) #there are no preceding words; simply put the footnote after the spans that mark the beginning of the line
	{

		if (match(fullVerseLine, /^(<div class='mt'>)((<a href='#FN[^>]+>[^<]+<[^>]+>)*)(.*$)/, matchArray)) #it's a title 
		{
			toReturn = matchArray[1] matchArray[2] "<a href='#FN"footnoteNumber"' " id "epub:type='noteref' class='noteref'>"footnoteSymbol"</a>" matchArray[4];
			return toReturn
		}      


		if (!match(fullVerseLine, /([\n^]+)((<[^<]+<\/[^>]+>)*)(¶\s*)?((<a href='#FN[^>]+>[^<]+<[^>]+>)*)/, matchArray)) #the last parenthesis in the regex is to avoid multiple footnotes at the beginning
		{
			print "ERROR: Could not find start of verse spans in " fullVerseLine; exit 18 
		}


		toReturn = matchArray[1] matchArray[2] matchArray[4] matchArray[5] "<a href='#FN"footnoteNumber"' epub:type='noteref' class='noteref'>"footnoteSymbol"</a>" #now add the footnote symbol
			toReturn = toReturn substr(fullVerseLine, length(matchArray[0])+1) #add the rest of the verse
			return toReturn


	}


	PREVIOUSIGNORECASE = IGNORECASE
		IGNORECASE = 1
		found = ""
		toReturn = ""
#now we split the matched verse into its constituent parts

		split(fullVerseLine, splitArray, /(<[^>]+>)|(\s*(^|\n)\s*<span class="verse"[^>]+>[^<]+<\/span>(<a href='#FN[^>]+>[^<]+<[^>]+>)*\s*)|((<a href='#FN[^>]+>[^<]+<[^>]+>)+)|([[:digit:]]+&#[[:digit:]]+;)|(\s*[\n$]\s*)/, sepsArray)


		verseTextOnly = ""
		for (o in splitArray)
		{ 
			verseTextOnly = verseTextOnly "" splitArray[o]
				toAppend = ""
				if (position = index(verseTextOnly,precedingWords) && !found) #we found the section in the xhtml where the footnote is to be inserted
				{
					found = "ja"
						position = length(precedingWords)
						if (position < length(verseTextOnly))
						{
							severedSepAfter = substr(verseTextOnly, position+1)
								if (!(position = lastIndex(splitArray[o], severedSepAfter)))
								{
									print "ERROR: could not find the severed part of the seperator in the original seperator when getting the modified verse. This shouldn't happen!"; exit 19
								}
							severedSepBefore = substr(splitArray[o], 1, position-1);
							toAppend = severedSepBefore "<a href='#FN"footnoteNumber"' "id" epub:type='noteref' class='noteref'>"footnoteSymbol"</a>" severedSepAfter sepsArray[o]
						}
						else
						{
							if (sepsArray[o] ~ /<a href='#FN/) #this is necessary because you might have footnotes directly after, make sure to put them in the right order
							{
								toAppend = splitArray[o] sepsArray[o] "<a href='#FN"footnoteNumber"' "id" epub:type='noteref' class='noteref'>"footnoteSymbol"</a>"
							}
							else
							{
								toAppend = splitArray[o] "<a href='#FN"footnoteNumber"' "id" epub:type='noteref' class='noteref'>"footnoteSymbol"</a>" sepsArray[o]
							}
						}
				}
			if (toAppend != "") #if we have already have footnotes pertaining to the same text
			{
				toReturn = toReturn toAppend
			}
			else
			{
				toReturn = toReturn splitArray[o] sepsArray[o]
			}
		}
	if (!found)
	{
		print "ERROR: Could not find " precedingWords " in (" fullVerseLine "). There is likely an issue with the regex or string parsing.\n verseTextOnly = " verseTextOnly "; precedingWords = " precedingWords; exit 16;
	}
	IGNORECASE = PREVIOUSIGNORECASE
		return toReturn

}

#same as write CSS but the special case for Sirach


#this function writes to css to the file with the name xhtmlFile (but adds .output to the end of this)
#xhtmlvariable: the full xhtml file of
#footnotes: an array, with this anatomy: footnotes[book][chapter][verse][index][precedingVerseText][footnoteSymbol] = actualFootnoteText
#footnotenumber: pass this argument if the footnotes to add start greater than 1 (e.g., you already did some work on the xhtmlVariable)
function writeCSS(xhtmlFile, xhtmlVariable, footnotes,  xhtmlWriteMe,  restOfCSSWriteMe,  newVerse,  chapter,  verseID,  endnotesPosition,  versePosition,  matchArray,  i,  j,  k,  l,  m,  n)
{
#START WORK HERE 2 (Maybe? Or maybe it works, check): This may not be correct for the apocrypha, since you lifted this algorithm from footnoteparser.awk; make sure it's correct for the apocrypha, make sure this works with regular notes, especially the one chapter books


		if (!(endnotesPosition = match(xhtmlVariable,xhtmlEndRegex, matchArray)))
		{
			print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
		}
xhtmlWriteMe = substr(xhtmlVariable, 1, endnotesPosition-1)
		restOfCSSWriteMe = substr(xhtmlVariable, endnotesPosition)
		for (i in footnotes) #book
		{
			for (j in footnotes[i]) #chapter
			{

				if (i in oneChapterBooks) #this is needed so that the verse_chapter prefix works out
				{
					chapter = 1;
				}
				else
				{
					chapter = j
				}
				for (k in footnotes[i][j]) #verse
				{


					if (!(versePosition = match(xhtmlVariable,"[\n^]\\s*<span class=\"verse\" id=\""verseLabels[i]""chapter"_"k"\">[[:digit:]]+&#[[:digit:]]+;</span>[^\n$]+(</\\s*div>\\s*)?[\n$]",matchArray)))#first we need to match the whole thing, because there might be a span at the end we need to compensate for in the original verse
					{
						print "ERROR: couldn't find " chapter ":" k " in xhtmlFile: " xhtmlFile; exit 14 
					}

					oldVerse = matchArray[0];
					newVerse = oldVerse

						if (!match(xhtmlVariable,"id=\""verseLabels[i]""chapter"_"k, matchArray)) # we match just the relevant part to properly fill the footnote at the end
						{
							print "ERROR: couldn't find " chapter ":" k " in xhtmlVariable: " xhtmlVariable; exit 14 
						}

					matchArray[0] = gensub(/id=['"]/,"","1",matchArray[0])
						matchArray[0] = gensub(/"/,"","g",matchArray[0])
						verseID = matchArray[0]
						for (l in footnotes[i][j][k]) #index
						{
							for (m in footnotes[i][j][k][l]) #verseText
							{
								for (n in footnotes[i][j][k][l][m]) #footnoteSymbol
								{

#first isolate the line where it takes place
									newVerse = getModifiedVerse(newVerse, m, n, l) #gets the verse (i.e., the line) with the footnote added in the right place
#now we insert the newVerse where the old verse was


										xhtmlWriteMe = xhtmlWriteMe "<aside epub:type='footnote' id=\"FN"l"\"><p class=\"f\"><a class=\"notebackref\" href=\"#"verseID"\"><span class=\"notemark\">"n"</span> "chapter"."k"</a>\n <span class=\"ft\">"footnotes[i][j][k][l][m][n]"</span></p></aside>\n";


								}
							}
						}

					xhtmlWriteMe = literalgensub(oldVerse, newVerse, 1, xhtmlWriteMe)
				}
			}
		}

	xhtmlWriteMe = xhtmlWriteMe restOfCSSWriteMe;

	print xhtmlWriteMe > xhtmlFile ".output"
#Remember that it's possible, but not likely, that two footnote symbols are right next to each other in a verse; keep that in mind

}

#writing Bel and the Dragon special cases
function writeBel(  xhtmlFile, xhtmlVariable,  xhtmlWriteMe,  restOfCSSWriteMe,  lastMatchPosition,  i,  adhocFootnotes)
{
	xhtmlFile = folderPrefix bookFiles["Bel and the Dragon"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)

		xhtmlVariable = fixEndingHorizontalRules(xhtmlVariable)

		xhtmlVariable = insert0and0(xhtmlVariable, "Bel and the Dragon","<div class='is'>")



		copySingleBookFootnotesArray("Bel and the Dragon", adhocFootnotes)
		writeCSS(xhtmlFile, xhtmlVariable, adhocFootnotes) 
		delete footnotes["Bel and the Dragon"]

}


function writeSusanna(  xhtmlFile,  xhtmlVariable,  adhocFootnotes) #I've modified the only title footnote found in the present resource in order to make this easier, if ever there are more you'll need a more general case 
{
	xhtmlFile = folderPrefix bookFiles["Susanna"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)
		xhtmlVariable = fixEndingHorizontalRules(xhtmlVariable)



		xhtmlVariable = insert0and0(xhtmlVariable, "Susanna", "<div class='is'>")

		copySingleBookFootnotesArray("Susanna", adhocFootnotes)
		writeCSS(xhtmlFile, xhtmlVariable, adhocFootnotes) 
		delete footnotes["Susanna"]

}

function writeManasseh(  xhtmlFile,  xhtmlVariable,  adhocFootnotes)
{
	xhtmlFile = folderPrefix bookFiles["Prayer of Manasseh"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)
		xhtmlVariable = fixEndingHorizontalRules(xhtmlVariable)



		xhtmlVariable = insert0and0(xhtmlVariable, "Prayer of Manasseh")


		copySingleBookFootnotesArray("Prayer of Manasseh", adhocFootnotes)
		writeCSS(xhtmlFile, xhtmlVariable, adhocFootnotes) 
		delete footnotes["Prayer of Manasseh"]
}

function writeS3Y(  xhtmlFile,  xhtmlVariable,  adhocFootnotes)
{
	xhtmlFile = folderPrefix bookFiles["Song of Three Youths"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)
		xhtmlVariable = fixEndingHorizontalRules(xhtmlVariable)

		copySingleBookFootnotesArray("Song of Three Youths", adhocFootnotes)
		writeCSS(xhtmlFile, xhtmlVariable, adhocFootnotes)

		delete footnotes["Song of Three Youths"]

}

#writing Sirach special cases
function writeSirach(  xhtmlFile,  xhtmlVariable,  xhtmlVariableTrimmedBefore,  xhtmlVariableTrimmedAfter,  newLineAtBeginningOfVerse,  newLineAtEndOfVerse,  precedingText,  precedingVerseTextStart,  footnoteNumber,  endnotesPosition,  matchArray,  xhtmlWriteMe,  restOfCSSWriteMe,  sirachPrologueHeading,  oldVerse,  newVerse,  i,  j,  k,  l,  m,  adhocFootnotes)
{


	xhtmlFile = folderPrefix bookFiles["Sirach"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)
		xhtmlVariable = fixEndingHorizontalRules(xhtmlVariable)

		if (!(endnotesPosition = match(xhtmlVariable,xhtmlEndRegex, matchArray)))
		{
			print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
		}
	xhtmlWriteMe = substr(xhtmlVariable, 1, endnotesPosition-1)
		restOfCSSWriteMe = substr(xhtmlVariable, endnotesPosition)


		for (j in footnotes["Sirach Prologue"]) #chapter
		{
			if (j == 1)
			{

				sirachPrologueHeading = "A Prologue made by an uncertain Author. "
			}
			else if (j == 2)
			{
				sirachPrologueHeading = "The Prologue of the Wisdom of Jesus, the Son of Sirach. "
			}
			else
			{
				print "ERROR: Found chapter " j " in Sirach Prologue. Sirach Prologue has only chapters 1 and 2."; exit 3
			}
			for (k in footnotes["Sirach Prologue"][j]) #verse
			{
				for (l in footnotes["Sirach Prologue"][j][k]) #footnote number
				{
					for (m in footnotes["Sirach Prologue"][j][k][l]) #preceding text
					{
						for (n in footnotes["Sirach Prologue"][j][k][l][m]) #footnoteSymbol
						{

							precedingText = m
								if(!(precedingVerseTextStart = index(xhtmlWriteMe, precedingText))) #maybe you first have to remove the prologue heading before finding it
								{

									precedingText = substr(m, length(sirachPrologueHeading)+1)

										if (j == 1) 
										{
											sirachPrologueStart = "This Jesus was the son of Sirach"
										}
										else if (j == 2)
										{
											sirachPrologueStart = "Whereas many and great things have been delivered unto us by the law and the prophets"
										}
										else
										{
											print "ERROR: something other than 1 or 2 for Sirach prologue!"; exit 18
										}
									if (!(precedingVerseTextStart = index(xhtmlWriteMe, sirachPrologueStart))) #the idea by doing this is to just find the line where the prologue is
									{
										print "ERROR: Could not find the text " sirachPrologueStart " in the Sirach prologue."; exit 1
									}


								}

#parsing the prologue block to pass to getModifiedVerse
							xhtmlWriteMeTrimmedBefore = substr(xhtmlWriteMe, 1, precedingVerseTextStart-1)
								newLineAtBeginningOfVerse = lastMatch(xhtmlWriteMeTrimmedBefore,"\n")
								xhtmlWriteMeTrimmedAfter = substr(xhtmlWriteMe, newLineAtBeginningOfVerse+1)

								if (!(precedingVerseTextStart = match(xhtmlWriteMeTrimmedAfter,/\n/)))
								{
									print "ERROR: could not find a new line after chopping Sirach verses."; exit 2
								}
#with this line, oldVerse now holds the prologue line, ready to pass to getModifiedVerse now
							oldVerse = substr(xhtmlWriteMe, newLineAtBeginningOfVerse + 1, precedingVerseTextStart)
								newVerse = getModifiedVerse(oldVerse, precedingText, n, l, "sirachprologuenote"l)


								xhtmlWriteMe = literalgensub(oldVerse, newVerse, 1, xhtmlWriteMe)

								xhtmlWriteMe = xhtmlWriteMe "<aside epub:type='footnote' id=\"FN"l"\"><p class=\"f\"><a class=\"notebackref\" href=\"#sirachprologuenote"l"\"><span class=\"notemark\">"n"</span></a>\n <span class=\"ft\">"footnotes["Sirach Prologue"][j][k][l][m][n]"</span></p></aside>\n";
						}
					}
				}
			}
		}


	xhtmlWriteMe = xhtmlWriteMe restOfCSSWriteMe;
	copySingleBookFootnotesArray("Sirach", adhocFootnotes)


		writeCSS(xhtmlFile, xhtmlWriteMe, adhocFootnotes)

		delete footnotes["Sirach"]
		delete footnotes["Sirach Prologue"]

}





{

if (!$1 || (!$2 && $2 != 0) || (!$3 && $3 != 0) || !$4 || !$6 || !$7)
{
print "ERROR: badly formated line: \n " $0; exit 1

}	
book = $1
chapter = $2
verse = $3
footnoteNumber = $4
precedingText = $5
footnoteSymbol = $6
footnoteText = $7

footnotes[book][chapter][verse][footnoteNumber][precedingText][footnoteSymbol] = footnoteText


}

END {

#Do special cases first
         writeS3Y()
        # writeSusanna()
	#writeBel()
	#	writeSirach()
	#	writeManasseh()

#START WORK HERE 1: write special cases for the one-chapter books and the tricky ones like prayer of manasseh: trick is to do special case first (usually title or prologue footnotes) and then call writeCSS for the rest of the ones found in normal verses


#	writeCSS(xhtmlFile, xhtmlVariable, newFootnoteArray)



}
