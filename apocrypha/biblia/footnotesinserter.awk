#this awk program takes as an input a tab seperated file in the following form:

#Book	Chapter	Verse	Footnote number for that verse	Preceding text	footnote symbol	footnote text

#EXIT CODES
#1: Problem finding the preceding text in the Sirach prologue

BEGIN {

folderPrefix = "../../denuded epub/OEBPS/"
xhtmlEndRegex = "</div>\\s*\n</div></body></html>(\\s*|\n)*$"


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

#returns the number of footnotes inserted
#xhtmlVariable: the xhtmlVariable to insert
#returns appropriately modified xhtmlVariable
function insert0and0(xhtmlVariable, book,  xhtmlVariableBefore,  xhtmlVariableAfter,  footnotesAdded,  oldFootnoteSection,  newFootnoteSection,  i,  j,  k,  matchPoint,  matchArray)
{

footnotesAdded = 0;
		if (!(book in footnotes))
		{
			print "ERROR: could not find " book " in the footnotes array."; exit 5
		}

        match(xhtmlVariable, /<div class="footnote">(\s|\n)*<hr\s*\/>(\s|\n)*.*$/, matchArray)
        oldFootnoteSection = matchArray[0]
        newFootnoteSection = "<div class=\"footnote\">\n<hr />\n"


	for (i in footnotes[book][0][0]) #footnotenumber
	{
		for (j in footnotes[book][0][0][i]) #precedingText
		{
			for (k in footnotes[book][0][0][i][j]) #footnoteSymbol
			{
				if (j ~ /^\s*$/) #the footnote pertains to the title because the preceding text is empty
				{
					if (!(matchPoint = match(xhtmlVariable, /<div class='mt'>/, matchArray)))
					{
						print "ERROR: couldn't find the title header for the book when inserting a footnote in the header."; exit 6;
					}
					xhtmlVariableBefore = substr(xhtmlVariable, 1, matchPoint + length(matchArray[0])-1) "<a href='#FN"++footnotesAdded"' id='00"footnotesAdded"' epub:type='noteref' class='noteref'>"k"</a>"
						xhtmlVariableAfter = substr(xhtmlVariable, matchPoint + length(matchArray[0]))
						xhtmlVariable = xhtmlVariableBefore xhtmlVariableAfter
newFootnoteSection = newFootnoteSection "<aside epub:type='footnote' id=\"FN"footnotesAdded"\"><p class=\"f\"><a class=\"notebackref\" href=\"#00"footnotesAdded"\"><span class=\"notemark\">"k"</span> "0"."0"</a>\n <span class=\"ft\">"footnotes[book][0][0][i][j][k]"</span></p></aside>\n"
				}
			}
		}
	}

delete footnotes[book][0][0]

 newFootnoteSection = newFootnoteSection "<hr />\n</div>\n</div></body></html>" #closing up the section

xhtmlVariable = literalgensub(oldFootnoteSection, newFootnoteSection, 1, xhtmlVariable)
return xhtmlVariable

}

#creates an adhoc array of size one, the only index is a SINGLE book (this is to parse the footnotes array so it'll work properly with writeCSS


#book: a book title
#adhocFootnotes: the array to copy to
function copySingleBookFootnotesArray(book, adhocFootnotes, j, k)
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
function change0Chapterto1(footnotesArray, book,  i)
{

	if (!(book in footnotesArray))
	{
		print "Error in function change0Chapterto1(): wrong book passed"; exit 8;
	}


#footnotes[book][chapter][verse][precedingVerseText][index][footnoteSymbol] = actualFootnoteText

	for (i in footnotesArray[book][0]) #verse
	{
		for (j in footnotesArray[book][0]) #precedingVerseText
		{
			for (k in footnotesArray[book][0][j]) #index
			{
				for (l in footnotesArray[book][0][j][k]) #chapter
				{
					footnotesArray[book][1][i][j][k][l] = footnotesArray[book][0][i][j][k][l]
						delete footnotesArray[book][0][i][j][k][l]
				}
				delete footnotesArray[book][0][i][j][k]
			}

			delete footnotesArray[book][0][i][j]

		}
		delete footnotesArray[book][0][i]
	}

	delete footnotesArray[book][0]

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


#takes a string like <span class="verse" id="MT5_11">11&#160;</span> <span class='wj'> Blessed are ye, when <span class='add'>men</span> shall revile you, and persecute <span class='add'>you</span>, and shall say all manner of evil against you falsely, for my sake.</span>

#and returns just the text

#if the string begins with a number, simply return the number; if it begins with more than two numbers, throw an error
function getLeadingNumber(string,  matchArray)
{
	if (match(string, /^\s*[[:digit:]]{2,}/))
	{
		print "ERROR: " string " has two leading numbers"; exit 15;
	}
	else if (match(string, /^\s*([[:digit:]])/, matchArray))
	{
		return matchArray[1];
	}
	else
	{
		return "";
	}
}


#returns fullVerseLine, but modified with the footnote symbol in the right place

#fullVerseLine: a full line (with newlines at the beginning at end), like: <span class="verse" id="C11_11">11&#160;</span> For it hath been declared unto me of you, my brethren, by them <span class='add'>which are of the house</span> of Chloe, that there are contentions among you. 
#precedingWords: the verse text before which the footnote symbol is to come
#footnoteSymbol: the symbol by which to demarcate the prescence of the note
#footnoteNumber: the number to ascribe to the footnote


function getModifiedVerse(fullVerseLine, precedingWords, footnoteSymbol, footnoteNumber,  verseTextOnly,  splitArray,  matchArray,  sepsArray,  severedSepBefore,  severedSepAfter,  found,  position,  toReturn,  o,  PREVIOUSIGNORECASE)
{

	if (!precedingWords || match(precedingWords,/^¶?\s*$/)) #there are no preceding words; simply put the footnote after the spans that mark the beginning of the line
	{
		if (!match(fullVerseLine, /([\n^])((<[^<]+<\/[^>]+>)*)(¶\s*)?((<a href='#FN[^>]+>[^<]+<[^>]+>)*)/, matchArray)) #the last parenthesis in the regex is to avoid multiple footnotes at the beginning
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

		split(fullVerseLine, splitArray, /(<[^>]+>)|(\s*(^|\n)\s*<span class="verse"[^>]+>[^<]+<\/span>(<a href='#FN[^>]+>[^<]+<[^>]+>)*\s*)|(<a href='#FN[^>]+>[^<]+<[^>]+>)|([[:digit:]]+&#[[:digit:]]+;)|(\s*[\n$]\s*)/, sepsArray)


		verseTextOnly = ""
		for (o in splitArray)
		{ 
			verseTextOnly = verseTextOnly "" splitArray[o]
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
							splitArray[o] = severedSepBefore "<a href='#FN"footnoteNumber"' epub:type='noteref' class='noteref'>"footnoteSymbol"</a>" severedSepAfter
						}
						else
						{
							splitArray[o] = splitArray[o] "<a href='#FN"footnoteNumber"' epub:type='noteref' class='noteref'>"footnoteSymbol"</a>"
						}
				}
			toReturn = toReturn splitArray[o] sepsArray[o]

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
#footnotes: an array, with this anatomy: footnotes[book][chapter][verse][precedingVerseText][index][footnoteSymbol] = actualFootnoteText
#footnotenumber: pass this argument if the footnotes to add start greater than 1 (e.g., you already did some work on the xhtmlVariable)
function writeCSS(xhtmlFile, xhtmlVariable, footnotes, footnoteNumber,  xhtmlWriteMe,  restOfCSSWriteMe,  newVerse,  verseID,  endnotesPosition,  leadingNumber,  versePosition,  matchArray,  i,  j,  k,  l,  m,  n)
{
#START WORK HERE 3: This may not be correct for the apocrypha, since you lifted this algorithm from footnoteparser.awk; make sure it's correct for the apocrypha, make sure this works with regular notes, especially the one chapter books

if (!footnoteNumber || footnoteNumber <= 0)
{
	footnoteNumber = 1
}
		if (!(endnotesPosition = match(xhtmlVariable,xhtmlEndRegex, matchArray)))
		{
			print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
		}
xhtmlWriteMe = substr(xhtmlVariable, 1, endnotesPosition-1)
		restOfCSSWriteMe = substr(xhtmlVariable, endnotesPosition)
		for (i in footnotes) #book
		{
			leadingNumber = getLeadingNumber(i);
			for (j in footnotes[i]) #chapter
			{
				for (k in footnotes[i][j]) #verse
				{

					        if (!(versePosition = match(xhtmlVariable,"[\n^]\\s*<span class=\"verse\" id=\"([A-Z])+"leadingNumber""j"_"k"\">[[:digit:]]+&#[[:digit:]]+;</span>[^\n$]+(</\\s*div>\\s*)?[\n$]",matchArray)))#first we need to match the whole thing, because there might be a span at the end we need to compensate for in the original verse
						{
							print "ERROR: couldn't find " j ":" k " in xhtmlFile: " xhtmlFile; exit 14 
						}

					oldVerse = matchArray[0];
					newVerse = oldVerse
						if (k == "0" && book ~ /Psalm/) #special case for Psalm; footnote can be in the header
						{
							if (!match(xhtmlVariable,"id='([A-Z])+"leadingNumber""j"_0", matchArray)) #if the note is in a psalm header, make the verse 0
							{
								print "ERROR: couldn't find " j ":" k " in xhtmlVariable: " xhtmlVariable; exit 14 
							}
						}
						else
						{
							if (!match(xhtmlVariable,"id=\"([A-Z])+"leadingNumber""j"_"k, matchArray)) # we match just the relevant part to properly fill the footnote at the end
							{
								print "ERROR: couldn't find " j ":" k " in xhtmlVariable: " xhtmlVariable; exit 14 
							}
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
									newVerse = getModifiedVerse(newVerse, m, n, footnoteNumber) #gets the verse (i.e., the line) with the footnote added in the right place
#now we insert the newVerse where the old verse was


										xhtmlWriteMe = xhtmlWriteMe "<aside epub:type='footnote' id=\"FN"footnoteNumber++"\"><p class=\"f\"><a class=\"notebackref\" href=\"#"verseID"\"><span class=\"notemark\">"n"</span> "j"."k"</a>\n <span class=\"ft\">"footnotes[i][j][k][l][m][n]"</span></p></aside>\n";


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
function writeBel(  xhtmlFile, xhtmlVariable,  xhtmlWriteMe,  restOfCSSWriteMe,  lastMatchPosition,  footnotesAdded,  i,  adhocFootnotes)
{
	xhtmlFile = folderPrefix bookFiles["Bel and the Dragon"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)




       xhtmlVariable = insert0and0(xhtmlVariable, "Bel and the Dragon")

		if (!(endnotesPosition = match(xhtmlVariable,xhtmlEndRegex, matchArray)))
		{
			print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
		}

lastMatchPosition = lastMatch(xhtmlVariable, "<aside epub:type='footnote' id=\"")

match(substr(xhtmlVariable, lastMatchPosition), /id="[^[:digit:]]+([[:digit:]]+)"/, matchArray)

if ((1 in matchArray))
{
footnotesAdded = matchArray[1]
}
else
{
footnotesAdded = 0
}


#START WORK HERE 2: Write the rest of the notes: but there's probably an error in the two functions that follow, same as in Manasseh
	copySingleBookFootnotesArray("Bel and the Dragon", adhocFootnotes)
writeCSS(xhtmlFile, xhtmlVariable, footnotes["Bel and the Dragon"], ++footnotesAdded) 


}

function writeManasseh(  xhtmlFile,  xhtmlVariable,  endnotesPosition,  lastMatchPosition,  matchArray,  footnotesAdded,  adhocFootnotes)
{
	xhtmlFile = folderPrefix bookFiles["Prayer of Manasseh"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)
       xhtmlVariable = insert0and0(xhtmlVariable, "Prayer of Manasseh")

		if (!(endnotesPosition = match(xhtmlVariable,xhtmlEndRegex, matchArray)))
		{
			print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
		}

lastMatchPosition = lastMatch(xhtmlVariable, "<aside epub:type='footnote' id=\"")

match(substr(xhtmlVariable, lastMatchPosition), /id="[^[:digit:]]+([[:digit:]]+)"/, matchArray)

if ((1 in matchArray))
{
footnotesAdded = matchArray[1]
}
else
{
footnotesAdded = 0
}


#START WORK HERE 1:  there seems to be an error copying the array elements and deleting them, writeCSS breaks (although it seems like the logic above works okay, do some more testing

	copySingleBookFootnotesArray("Prayer of Manasseh", adhocFootnotes)
change0Chapterto1(adhocFootnotes, "Prayer of Manasseh")
writeCSS(xhtmlFile, xhtmlVariable, adhocFootnotes, ++footnotesAdded) 



}

#writing Sirach special cases
function writeSirach(  xhtmlFile,  xhtmlVariable,  precedingVerseTextStart,  footnoteNumber,  endnotesPosition,  matchArray,  xhtmlWriteMe,  restOfCSSWriteMe,  sirachPrologueHeading,  oldVerse,  newVerse,  i,  j,  k,  l,  m,  adhocFootnotes)
{


	xhtmlFile = folderPrefix bookFiles["Sirach"]
		xhtmlVariable = storeTextFileInVariable(xhtmlFile)


		if (!(endnotesPosition = match(xhtmlVariable,xhtmlEndRegex, matchArray)))
		{
			print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
		}
	xhtmlWriteMe = substr(xhtmlVariable, 1, endnotesPosition-1)
		restOfCSSWriteMe = substr(xhtmlVariable, endnotesPosition)


		footnoteNumber = 1
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

							oldVerse = m
								if(!(precedingVerseTextStart = index(xhtmlVariable, m))) #maybe you first have to remove the prologue heading before finding it
								{

									oldVerse = substr(m, length(sirachPrologueHeading)+1)
										if (!(precedingVerseTextStart = index(xhtmlVariable, oldVerse)))
										{
											print "ERROR: Could not find the text " m " in the Sirach prologue."; exit 1
										}


								}
							newVerse = oldVerse "<a href='#FN"footnoteNumber"' id='sirachprologuenote"footnoteNumber"' epub:type='noteref' class='noteref'>" n "</a>"
								xhtmlWriteMe = literalgensub(oldVerse, newVerse, 1, xhtmlWriteMe)

								if (j == 1)
								{
									xhtmlWriteMe = xhtmlWriteMe "<aside epub:type='footnote' id=\"FN"footnoteNumber"\"><p class=\"f\"><a class=\"notebackref\" href=\"#sirachprologuenote"footnoteNumber++"\"><span class=\"notemark\">"n"</span> Sirach Prologue 1</a>\n <span class=\"ft\">"footnotes["Sirach Prologue"][j][k][l][m][n]"</span></p></aside>\n";
								}
								else
								{

									xhtmlWriteMe = xhtmlWriteMe "<aside epub:type='footnote' id=\"FN"footnoteNumber"\"><p class=\"f\"><a class=\"notebackref\" href=\"#sirachprologuenote"footnoteNumber++"\"><span class=\"notemark\">"n"</span> Sirach Prologue 2</a>\n <span class=\"ft\">"footnotes["Sirach Prologue"][j][k][l][m][n]"</span></p></aside>\n";
								}
						}
					}
				}
			}
		}

	xhtmlWriteMe = xhtmlWriteMe restOfCSSWriteMe;

	copySingleBookFootnotesArray("Sirach", adhocFootnotes)

		writeCSS(xhtmlFile, xhtmlWriteMe, adhocFootnotes, footnoteNumber)

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
writeManasseh()
                writeBel()
		writeSirach()

#START WORK HERE 4: write special cases for the one-chapter books and the tricky ones like prayer of manasseh: trick is to do special case first (usually title or prologue footnotes) and then call writeCSS for the rest of the ones found in normal verses


#	writeCSS(xhtmlFile, xhtmlVariable, newFootnoteArray)



}
