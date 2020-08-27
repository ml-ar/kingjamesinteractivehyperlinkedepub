#this program takes the list of extracted footnotes in the form:

#<div id="lf0610_footnote_nt005" class="type-footnote note"><a id="lf0610_label_010" href="#lf0610_footnote_nt005_ref">* </a><p id="Bible_0610_OldAuth_23432">Ps. 33. 6. &c 136. 5. Acts 14. 15. &c 17. 24. Heb. 11. 3.</p></div>
#<div id="lf0610_footnote_nt006" class="type-footnote note"><a id="lf0610_label_013" href="#lf0610_footnote_nt006_ref">* </a><p id="Bible_0610_OldAuth_23433">2 Cor. 4. 6.</p></div>
#... etc

#And for each first finds them in the resource "webpageReferenceFile" and from there infers what xtml it's in, and then places the footnote properly in the xthml
#After finding all the footnotes for a book, it then outputs a new xtml that's the same as the old except the footnotes have been properly added

#takes a footnote reference number (e.g., lf0610_footnote_nt005) and returns the xhtml file in which book appears


#ERROR CODES
#1: The program failed to find the xhtml file for the verse a footnote referenced
#2: The program failed to parse the webpage reference file
#3: The program failed to find the href id for the line in the footnote input file
#4: The program failed to find the href id in the web page refenence
#5: The program could not find the book title in the web page resource
#THIS IS WRONG, START WORK HERE
function findXHTMLBook(footnoteReferenceNumber,  cmd,  result)
{
	cmd =  "grep -l " footnoteReferenceNumber "..'Old Testament HTML/oldtestamentendnotesremoved.txt'"
	if ((cmd | getline result) <= 0)
	{
		print "ERROR: could not find the .xhtml for the footnote " footnoteReferenceNumber;
		exit 1;
	}
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

BEGIN {
	webpageReferenceFile = "Old Testament HTML/oldtestamentendnotesremoved.txt"
	webpageReferenceVariable = ""
		while ((getline line < webpageReferenceFile) > 0)
		{
			webpageReferenceVariable=webpageReferenceVariable "\n" line
		}
	if (!webpageReferenceVariable)
	{
		print "ERROR parsing the webpage reference file to locate notes! Perhaps you mispelled the file name: " webpageReferenceFile
		exit 2
	}

	book = ""
		verse = ""
}

{
ref = getRefFromLine();
#ref now holds the id in the form of lf0610_footnote_nt005

		if (!book) #this if statement infers the book
		{
			book =	inferBookFromRefId(ref)
		}
#START WORK HERE: the book has properly been inferred for this note

#now have to find in the appropriate xhtml for this book

}

END {
exit 0;
}
