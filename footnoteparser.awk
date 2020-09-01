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

#this function writes to css to the file with the name xhtmlFile (but adds .output to the end of this)
#xhtmlvariable: the full xhtml file of
#footnotes: an array, with this anatomy: footnotes[(int)chapter][(int)verse][(string)precedingVerseText][(string)symbol] = footnote text
function writeCSS(xhtmlFile, xhtmlVariable, footnotes,  cssWriteMe,  restOfCSSWriteMe,  footnoteNumber,  position)
{
footnoteNumber = 1
	if (!(position = match(cssFile,"</div><div class=\"footnote\">\\s*\\n\\s*<hr />\\s*\\n", matchArray)))
	{
		print "ERROR: could not find the beginning of footnotes for " xhtmlFile; exit 13
	}

cssWriteMe = substr(cssFile, 1, position-1+length(matchArray[0]))
restOfCSSWriteMe = substr(cssFile, position+length(matchArray[0]))

#START WORK HERE: need to write the file; take guidance from awkscript.awk


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
}

{
	match($0,/nt005_ref">\s*(.)\s*<\/a>/, matchArray)
		footnoteSymbol = matchArray[1] #getting footnote symbol, e.g., †, *
		newBook = ""
		ref = getRefFromLine();
#ref now holds the id in the form of lf0610_footnote_nt005

verseText = ""
       chapter = getChapterFromRef(ref)
               verse = getVerseFromRef(ref)
verseText = getPrecedingVerseTextFromRef(ref)

#START WORK HERE 2; have to improve workflow for multiple files

		newBook = inferBookFromRefId(ref)
		if (newBook != book)
		{
			book = newBook;
			xhtmlFile = findXhtmlFile(book)
				xhtmlVariable = storeTextFileInVariable(xhtmlFile)
				if (!xhtmlFile || !xhtmlVariable || !book)
				{
					print "Error parsing book and xhtml for " ref; exit 6
				}

		}


#now have to find in the appropriate xhtml file for this book



# the book, chapter, and verse have been properly inferred for this note
#xhtmlFile now holds the name of the file where the note pertains
	print book
		print chapter ":" verse
		print verseText

#parsing the marginal note text itself
		footnoteText = gensub(/(<[^>]+>)+$/,"","1")
		footnoteText = gensub(/^.+>\s*/,"","1", footnoteText);

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
# 		It is possible, but not likely, that you have two footnotes with the exact same book, chapter, verse, and verseText (i.e., right next to each other). Make sure you keep that in mind.

		footnotes[book][chapter][verse][verseText][footnoteSymbol] = footnoteText

#START WORK HERE; can properly extract book, chapter, verse, and text before each footnote; now figure out how to write the new CSS (look in awkscript.awk for a suggestion)


		}

END {
exit 0;
}
