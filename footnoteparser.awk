#this program takes the list of extracted footnotes in the form:

#<div id="lf0610_footnote_nt005" class="type-footnote note"><a id="lf0610_label_010" href="#lf0610_footnote_nt005_ref">* </a><p id="Bible_0610_OldAuth_23432">Ps. 33. 6. &c 136. 5. Acts 14. 15. &c 17. 24. Heb. 11. 3.</p></div>
#<div id="lf0610_footnote_nt006" class="type-footnote note"><a id="lf0610_label_013" href="#lf0610_footnote_nt006_ref">* </a><p id="Bible_0610_OldAuth_23433">2 Cor. 4. 6.</p></div>
#... etc

#And for each first finds them in the resource "webpageReferenceFile" and from there infers what xhtml it's in, and then places the footnote properly in the xthml
#After finding all the footnotes for a book, it then outputs a new xhtml that's the same as the old except the footnotes have been properly added

#takes a footnote reference number (e.g., lf0610_footnote_nt005) and returns the xhtml file in which book appears


#EXIT CODES
#0: The program exited successfully
#1: The program failed to find the xhtml file for the verse a footnote referenced
#2: The program failed to parse the webpage reference file
#3: The program failed to find the href id for the line in the footnote input file
#4: The program failed to find the href id in the web page refenence
#5: The program could not find the book title in the web page resource
#6: The program had a generic xhtml/book processing error
#7: The program could not parse the chapter from the webpage resource
#8: The program failed to extract the chapter number from the surrounding chapter tags in the webpage resource
#9: The program could not parse the verse from the webpage resource
#10: The program failed to extract the verse number from the surrounding verse tags in the webpage resource
#11: The program failed to split the web page resource verse into just its text
#12: The program could not find an appropriate XHTML for the associated book
#13: The program could not find the proper place for the list of endnotes at the end of the xhtml file
#14: The program failed to find the chapter and verse in the appropriate XHTML
#15: The leading number finder found two or more leading numbers
#16: The program failed to find the preceding verse text in the xhtml
#17: Bug in literalgensub, it could not iterate the appropriate number of times
function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }


#just like gensub, except it works on literals instead of regexes
function literalgensub(literalPattern, literalSubstitution, number, string,  toReturn,  position,  mutilatedString,  matchArray,  i)
{

	toReturn = ""
		if (!string)
		{
			string = $0
		}



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

#takes a book and returns the name of the XHTML file that it's associated with
#if it finds nothing, return null
function findXhtmlFile(book,  cmd,  result)
{

cmd = "grep -l \"<li><a href='index.xhtml'>"book"\" Original\\ epub/*.xhtml"
 if ((cmd | getline result) <= 0)
 {
   print "ERROR: Could not find XHTML file for " book; exit 12
 }
 return result;
}

function lastMatch(stringToCheck, regex, array,  mutilatedString,  pointer,  lastPosition) #minimially tested, seems to be working
{
   if (!regex)
   {
    print "FATAL ERROR: empty regex passed to function lastMatch. This was the string to check: \n" stringToCheck
    exit 1
   }

	mutilatedString = stringToCheck;
	pointer = 1;
	while (lastPosition = match(mutilatedString, regex, array))
	{
		mutilatedString = substr(mutilatedString, ++lastPosition)
			pointer += lastPosition - 1

	}
	return pointer-1;
}

#takes a ref in the form of lf0610_footnote_nt005 and returns the name of the book the footnote appertains to (by scrubbing the webpage reference)
function inferBookFromRefId(ref,  refLocationInWebPagereference,  curtailedWebpageReferenceVariable,  patsplitArray,  toReturn)
{
	if (!(refLocationInWebPagereference = index(webpageReferenceVariable,ref)))
	{
		print "ERROR: Could not find ref " ref " in the web page reference!"; print ref; exit 4;
	}

	curtailedWebpageReferenceVariable = substr(webpageReferenceVariable, 1, refLocationInWebPagereference)
		patsplit(curtailedWebpageReferenceVariable, patsplitArray, /<div id="[^"]+" class="type-part [^"]+">/)
		if (!isarray(patsplitArray) || length(patsplitArray) <= 0)
		{
			print "ERROR: could not parse the webpage resource for the book title"; exit 5;
		}
	toReturn = patsplitArray[length(patsplitArray)];
	toReturn = gensub(/<div id="[^"]+" class="type-part\s*([^"]+)">/,"\\1","1",toReturn)
			return toReturn;
			}

#returns the ref id from the current record
function getRefFromLine(  ref,  matchArray)
{
match($0, /href="[^"]+"/, matchArray)

if (!matchArray[0])
{
print "ERROR: Could not parse the href for " $0; exit 3;
}

ref = gensub(/href="([^"]+)"/,"\\1","1", matchArray[0])
ref = gensub(/_ref/,"","1",ref)
return ref;
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


#takes a ref in the form of lf0610_footnote_nt005 and returns the chapter for it

function getChapterFromRef(ref,  patsplitArray,  matchArray,  refPoint,  tempWebpageReferenceVariable)
{

	if (!(refPoint = index(webpageReferenceVariable, ref)))
	{
		print "ERROR: Could not locate the reference in " webpageReferenceFile; exit 4;
	}

	tempWebpageReferenceVariable = substr(webpageReferenceVariable, 1, refPoint)

		patsplit(tempWebpageReferenceVariable, patsplitArray, /[\n^]\s*<div id="lf0610_div_[[:digit:]]+" class="type-chapter chapter_AV">\s*\n\s*<h2 id="lf0610_label_[[:digit:]]+">[[:digit:]]+<\/h2>/)

		if (!isarray(patsplitArray) || length(patsplitArray) <= 0)
		{
			print "Error parsing chapter. Maybe the regex is broken."; exit 7;
		}

	match(patsplitArray[length(patsplitArray)], /([[:digit:]]+)<\/h2>/, matchArray)

		if (!isarray(matchArray) || length(matchArray) < 2) #there needs to be at least two in the match array, since we're using parentheses
		{
			print "Error extracting the digit from the inferred chapter indicia. Maybe the regex is broken."; exit 8;
		}

	return (matchArray[1]);

}

#takes a ref in the form of lf0610_footnote_nt005 and returns the verse number for it
function getVerseFromRef(ref,  patsplitArray,  matchArray,  refPoint,  tempWebpageReferenceVariable)
{
	if (!(refPoint = index(webpageReferenceVariable, ref)))
	{
		print "ERROR: Could not locate the reference in " webpageReferenceFile; exit 4;
	}

	tempWebpageReferenceVariable = substr(webpageReferenceVariable, 1, refPoint)

		patsplit(tempWebpageReferenceVariable, patsplitArray, /[\n^]<p id="Bible_0610_OldAuth_[[:digit:]]+"><span id="lf0610_label_[[:digit:]]+">([[:digit:]]+)<\/span>/)

		if (!isarray(patsplitArray) || length(patsplitArray) <= 0)
		{
			print "Error parsing verse. Maybe the regex is broken."; exit 9;
		}


	match(patsplitArray[length(patsplitArray)], /([[:digit:]]+)<\/span>/, matchArray)

		if (!isarray(matchArray) || length(matchArray) < 2) #there needs to be at least two in the match array, since we're using parentheses
		{
			print "Error extracting the digit from the inferred verse indicia. Maybe the regex is broken."; exit 10;
		}

return (matchArray[1]);
}

#this function takes a ref in the form of lf0610_footnote_nt005 and returns the text before it of the same verse
#for example, say the ref pertains to genesis 1:1
#In the beginning God created the heaven and the earth.
#If the ref is directly after heaven, then this function returns: "In the beginning God created the heaven"
function getPrecedingVerseTextFromRef(ref,  regex,  matchArray,  splitArray,  sepsArray,  toReturn,  i)
{

	regex = "[\n]\\s*[^\n]+"ref"[^\n]+\n"

		if (!(match(webpageReferenceVariable, regex, matchArray)))
		{
			print "ERROR: Could not find the verse the ref refers to."; exit 4
		}

	matchArray[0] = gensub(/^\s*|\s*$/,"","1",matchArray[0]) #getting rid of leading and trailing whitespace`
		matchArray[0] = gensub(/&#x[[:digit:]]+;\s*/,"","1",matchArray[0]) #getting rid of hex digits

		split(matchArray[0], splitArray, /(<[^>]+>)|(<[^>]+>\s*[[:digit:]]+\s*<[^>]+>)/, sepsArray)
		toReturn = ""

		if (!(1 in splitArray) || !isarray(splitArray))
		{
			print "Error splitting the webpage resource verse to get just the text of the verse."; exit 11;
		}

	for (i in splitArray)
	{
		toReturn = toReturn splitArray[i]
			if (sepsArray[i] ~ ref) #stop parsing the text if the next is the note; at the end of this is where you need to insert the note
			{
				break;
			}
	}


	toReturn = gensub(/^\s*|\s*$/,"","1",toReturn) #getting rid of leading and trailing whitespace`

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


function getModifiedVerse(fullVerseLine, precedingWords, footnoteSymbol, footnoteNumber,  verseTextOnly,  splitArray,  sepsArray,  found,  position,  toReturn,  o)
{
	found = ""
		toReturn = ""
#now we split the matched verse into its constituent parts
		split(fullVerseLine, splitArray, /(<[^>]+>)|([[:digit:]]+&#[[:digit:]]+;)|(¶)|(\s*[\n$]\s*)/, sepsArray)


verseTextOnly = ""
		for (o in splitArray)
		{ 

			verseTextOnly = verseTextOnly "" splitArray[o]
				if (position = index(verseTextOnly,precedingWords) && !found) #we found the section in the xhtml where the footnote is to be inserted
				{
found = "ja"

						if (length(verseTextOnly) == length(precedingWords)) #it's the same length; put it after the seps
						{
							toReturn = toReturn "" splitArray[o] "" sepsArray[o] "<a href='#FN"footnoteNumber"' epub:type='noteref' class='noteref'>"footnoteSymbol"</a>" #now add the footnote symbol
						}
						else #the text goes longer than the preceding words; this means that the footnote is somewhere in the middle of this element
						{
							toReturn = toReturn substr(splitArray[o], 1, position+length(precedingWords)) ##first chop the verse into everything before
								toReturn = toReturn "<a href='#FN"footnoteNumber"' epub:type='noteref' class='noteref'>"footnoteSymbol"</a>" #now add the footnote symbol
								toReturn = toReturn substr(splitArray[o], position+1+length(precedingWords)) sepsArray[o] #now add the rest of the verse

						}

				}
				else
				{
					toReturn = toReturn "" splitArray[o] "" sepsArray[o]
				}


		}


	if (!found)
	{
		print "ERROR: Could not find " precedingWords " in (" fullVerseLine "). There is likely an issue with the regex or string parsing."; exit 16;
	}

	return toReturn

}

#this function writes to css to the file with the name xhtmlFile (but adds .output to the end of this)
#xhtmlvariable: the full xhtml file of
#footnotes: an array, with this anatomy: footnotes[book][chapter][verse][precedingVerseText][index][footnoteSymbol] = actualFootnoteText
function writeCSS(xhtmlFile, xhtmlVariable, footnotes,  xhtmlWriteMe,  restOfCSSWriteMe,  newVerse,  footnoteNumber,  endnotesPosition,  leadingNumber,  versePosition,  matchArray,  i,  j,  k,  l,  m,  n)
{
	footnoteNumber = 1
		if (!(endnotesPosition = match(xhtmlVariable,"</div><div class=\"footnote\">\\s*\\n\\s*<hr />\\s*\\n", matchArray)))
		{
			print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
		}

	xhtmlWriteMe = substr(xhtmlVariable, 1, endnotesPosition-1+length(matchArray[0]))
		restOfCSSWriteMe = substr(xhtmlVariable, endnotesPosition+length(matchArray[0]))
		for (i in footnotes) #book
		{
                    leadingNumber = getLeadingNumber(i);
			for (j in footnotes[i]) #chapter
			{
				for (k in footnotes[i][j]) #verse
				{
					for (l in footnotes[i][j][k]) #precedingVerseText
					{
						for (m in footnotes[i][j][k][l]) #index
						{
							for (n in footnotes[i][j][k][l][m]) #footnoteSymbol
							{
print "footnote to print: " footnotes[i][j][k][l][m][n]


#first isolate the line where it takes place
								if (!(versePosition = match(xhtmlVariable,"[\n^]\\s*<span class=\"verse\" id=\"([A-Z])+"leadingNumber""j"_"k"\">[[:digit:]]+&#[[:digit:]]+;</span>[^\n$]+(</\\s*div>\\s*)?[\n$]",matchArray)))#first we need to match the whole thing, because there might be a span at the end we need to compensate for in the original verse
								{
									print "ERROR: couldn't find " j ":" k " in xhtmlFile: " xhtmlFile; "\n" xhtmlWriteMe; exit 14 
								}

								newVerse = getModifiedVerse(matchArray[0], l, n, footnoteNumber) #gets the verse (i.e., the line) with the footnote added in the right place
#now we insert the newVerse where the old verse was
print " newVerse is " newVerse "; old verse is " matchArray[0]


									xhtmlWriteMe = literalgensub(matchArray[0], newVerse, 1, xhtmlWriteMe)
print "xhtmlWrite me is: " xhtmlWriteMe

									if (!match(xhtmlVariable,"id=\"([A-Z])+"leadingNumber""j"_"k, matchArray)) # we match just the relevant part to properly fill the footnote at the end
									{
										print "ERROR: couldn't find " j ":" k " in xhtmlVariable: " xhtmlVariable; exit 14 
									}


								matchArray[0] = gensub(/id="/,"","1",matchArray[0])
									matchArray[0] = gensub(/"/,"","g",matchArray[0])


									xhtmlWriteMe = xhtmlWriteMe "<aside epub:type='footnote' id=\"FN"footnoteNumber++"\"><p class=\"f\"><a class=\"notebackref\" href=\"#"matchArray[0]"\"><span class=\"notemark\">"n"</span> "j"."k"</a>\n <span class=\"ft\">"footnotes[i][j][k][l][m][n]"</span></p></aside>\n";



							}
						}
					}
				}
			}
		}

xhtmlWriteMe = xhtmlWriteMe "\n" restOfCSSWriteMe;

print xhtmlWriteMe > xhtmlFile ".output"
#Remember that it's possible, but not likely, that two footnote symbols are right next to each other in a verse; keep that in mind

							}

BEGIN {
	webpageReferenceFile = "Old Testament HTML/oldtestamentendnotesremoved.txt"
		webpageReferenceVariable = storeTextFileInVariable(webpageReferenceFile)
		if (!webpageReferenceVariable)
		{
			print "ERROR parsing the webpage reference file to locate notes! Perhaps you mispelled the file name: " webpageReferenceFile
				exit 2
		}

	book = ""
		chapter = ""
		verse = ""
		xhtmlFile = ""
		OFS = ""
}

{
	match($0,/nt[[:digit:]]+_ref">\s*(.)\s*<\/a>/, matchArray)
		footnoteSymbol = matchArray[1] #getting footnote symbol, e.g., †, *
		newBook = ""
		ref = getRefFromLine();
#ref now holds the id in the form of lf0610_footnote_nt005

	verseText = ""
		chapter = getChapterFromRef(ref)
		verse = getVerseFromRef(ref)
		verseText = getPrecedingVerseTextFromRef(ref)
#START WORK HERE: have to improve workflow for multiple files: I think everything is working though

		newBook = inferBookFromRefId(ref)
		if (newBook != book)
		{
			if (book && xhtmlFile && xhtmlVariable) #have to write
			{
				print "printing book;"
					writeCSS(xhtmlFile, xhtmlVariable, footnotes)
			}
			book = newBook;
			xhtmlFile = findXhtmlFile(book)
				xhtmlVariable = storeTextFileInVariable(xhtmlFile)
				if (!xhtmlFile || !xhtmlVariable || !book)
				{
					print "Error parsing book and xhtml for " ref; exit 6
				}
			delete footnotes;
		}


#now have to find in the appropriate xhtml file for this book



# the book, chapter, and verse have been properly inferred for this note
#xhtmlFile now holds the name of the file where the note pertains
#parsing the marginal note text itself
	footnoteText = gensub(/(<[^>]+>)+$/,"","1")
		footnoteText = gensub(/^.+>\s*/,"","1", footnoteText);
	print book
		print chapter ":" verse
		print verseText
print footnoteText

#footnotes anatomy:
#book: plain bible book title
#chapter: chapter number
#verse:



#footnotes anatomy:
#book (string): plain bible book title
#chapter (int): chapter number
#verse (int): the plain verse number
#footnoteSymbol (string): the symbol associated with the footnote
#verseText: the text located between the start of the verse and ending at where the footnote symbol is to be (this might be blank, i.e., the footnote is right at the beginning of the line
#footnoteText (string): The actual footnote text
#the fifth array index is just a counter so that the notes can be inserted in the right order
# 		It is possible, but not likely, that you have two footnotes with the exact same book, chapter, verse, and verseText (i.e., right next to each other). Make sure you keep that in mind.

		footnotes[book][chapter][verse][verseText][length(footnotes[book][chapter][verse])+1][footnoteSymbol] = footnoteText

#can properly extract book, chapter, verse, and text before each footnote; now figure out how to write the new CSS (look in awkscript.awk for a suggestion)


		}

END {
print "printing book at the end"
writeCSS(xhtmlFile, xhtmlVariable, footnotes) #do one last write
exit 0;
}
