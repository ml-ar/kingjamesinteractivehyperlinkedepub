#this awk script is ment to act on the marginal notes

#parameter:
#CSSname: the name of the css file to writeto
#CSSfile: the original contents of the original css file to write from
function writeCSS(cssName, cssFile,  position,  cssWriteMe,  footnote,  matchArray,  i,  j,  k)
{
footnote = 1
	if (!(position = match(cssFile,"</div><div class=\"footnote\">\\s*\\n\\s*<hr />\\s*\\n", matchArray)))
	{
		print "ERROR: could not find the beginning of footnotes for " cssName; exit 1
	}

position

cssWriteMe = substr(cssFile, 1, position-1+length(matchArray[0]))
restOfCSSWriteMe = substr(cssFile, position+length(matchArray[0]))


position += length(matchArray[0])
	for (i in notes)
	{
		for (j in notes[i])
		{
			for (k in notes[i][j])
			{

				if (!match(cssFile,"id=\"([A-Z])+"leadingNumber""i"_"j"\">[[:digit:]]+&#[[:digit:]]+;</span>",matchArray))#first we need to match the whole thing, because there might be a span at the end we need to compensate for in the original verse
				{
					print "ERROR: couldn't find " i ":" j " in " cssFile; exit 1 
				}
#this puts an asterisk for the verse itself
				cssWriteMe = gensub("("matchArray[0]"[^\n$]+)(</\\s*div>\\s*)?","\\1<a href='#FN"footnote"' epub:type='noteref' class='noteref'>*</a>\\2","1",cssWriteMe);
				cssWriteMe = cssWriteMe"\n"


					if (!match(cssFile,"id=\"([A-Z])+"leadingNumber""i"_"j, matchArray)) #now we match just the relevant part to properly fill the footnote at the end
					{
						print "ERROR: couldn't find " i ":" j " in " cssFile; exit 1 
					}

				matchArray[0] = gensub(/id="/,"","1",matchArray[0])
					matchArray[0] = gensub(/"/,"","g",matchArray[0])


					cssWriteMe = cssWriteMe "<aside epub:type='footnote' id=\"FN"footnote++"\"><p class=\"f\"><a class=\"notebackref\" href=\"#"matchArray[0]"\"><span class=\"notemark\">*</span> "i"."j"</a>\n <span class=\"ft\">"notes[i][j][k]"</span></p></aside>";
			}
		}
	}

cssWriteMe = cssWriteMe "\n" restOfCSSWriteMe;
print cssWriteMe > cssName

}


BEGIN {
book = ""
leadingNumber = ""
}

{
	match($0, /^([[:digit:]]\s+)?(\S)+/,matchArray) #matchArray now holds the book

		if (!matchArray[0])
		{
			print "ERROR: nothing found for the book $0. Exiting."; exit 1
		}

	if (book != matchArray[0]) #this is a newbook; have to search for the right file
	{
		if (book)
		{
			writeCSS(bookCSSFile".test", bookCSS)
				delete notes;
		}
		bookCSSFile = ""
			book = matchArray[0]
			if (match(book,/^\s*[[:digit:]]/, matchArray))
			{
					leadingNumber = gensub(/^\s*/,"","1",matchArray[0])
			}
			else
			{
				leadingNumber = ""
			}

		cmd = "grep '<title>King James Version + Apocrypha "book".*</title>$' *.xhtml"
			while ( ( cmd | getline result ) > 0 ) {
				match(result,/^[^:]+/,matchArray)
					bookCSSFile = matchArray[0]
					break; #only need the first result
			} 
		print "bookCSSFile = " bookCSSFile "; book = " book
			if (!bookCSSFile)
			{
				print "ERROR: could not find CSS file for " book "; the line is " $0;  exit 1
			}


		bookCSS = ""
#bookCSS holds the name of the CSS file

			while ((getline line < bookCSSFile) > 0)
			{
				bookCSS=bookCSS "\n" line
			}
		if (!bookCSS)
		{
			print "ERROR extracting book for " $0; exit 1
		}
	}
	bookCSS = gensub(/^\s*/,"","1",bookCSS)
#bookCSS holds the whole CSS file
		strippedLine = gensub(book"\\s*", "","1")
		match(strippedLine,/^[[:digit:]]+/,matchArray)
		chapter = matchArray[0]
		strippedLine = gensub(chapter"\\s*:\\s*","","1",strippedLine)
		match(strippedLine,/^[[:digit:]]+/,matchArray)
		verse = matchArray[0]

#chapter holds the appropriate chapter, verse holds the appropriate verse

		if (!(position = match(bookCSS,"(^|\n)[^\n$]+"chapter"_"verse"[^\n$]+",matchArray)))
		{
			print "ERROR: could not find " book " " chapter ":" verse " in " booksCSS; exit 1
		}
	strippedLine = gensub(/^\s*[[:digit:]]+\s*/,"","1",strippedLine); #stripped line now holds the text
#start work here; book, booksCSS, chapter and vers have been properly parsed, all you have to do is find and replace the marginal notes where appropriate



#notes anatomy: notes[chapter][verse][text]
		notes[chapter][verse][length(notes[chapter][verse])+1] = strippedLine

}

END { #need to do the last write
writeCSS(bookCSSFile".test",bookCSS)
}
