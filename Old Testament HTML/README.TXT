notesonlyfromhtml.txt: The original notes, just taken at the end (but amp; html codes changed to regular &c)
notesonlyfromhtmlspansmodified.txt: Same as above, except changed the italics spans and the LORD spans to match the convention in the resulting epub
notesonlyfromhtmlampersandspreserved.txt: Same as notesonlyfromhtml.txt, but the html ampersand codes (amp;) have been preserved. 
oldtestamentcompletemarkup.txt: The old testament source with notes
oldtestamentendnotesremoved.txt: The same as above, except the notes at the end have been removed (and placed in notesonlyfromhtml.txt)
oldtestamentendnotesremovedmodified.txt: the above, except it's been modified for errors: for example, in Genesis 4:8 the original has a semicolon where the original has a comma
notesonlyfromhtmlampersandspreservedspansmodifiedFORTESTING.txt: this is modified as we put the notes through footnoteparser.awk; when we encounter a note that doesn't parse, we see what the problem is, fix it, and then remove the preceding notes from this file in order to save time when testing
