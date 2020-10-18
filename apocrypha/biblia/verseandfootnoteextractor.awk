#for an input html, this program outputs the following tab-seperated data:

#book	chapter	verse	full verse text (italics are surrounded thus <i>text</i>)	footnote symbol	footnote text	preceding verse text (italics preserved)

#the last four can be repeated for as many footnotes as necessary
#if chapter is 0, that means it's just verses





#ERROR CODES
#1: Could not find the line describing the book chapter:verse
#2: Could not find the text header in the xhtml









BEGIN {
	RS = "^$"
		OFS = "	"


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
		bookFiles["1 Esdras"] = "1ES.xhtml"
		bookFiles["2 Esdras"] = "2ES.xhtml"
		bookFiles["Tobit"] = "TOB.xhtml"
		bookFiles["Judith"] = "JDT.xhtml"
		bookFiles["Esther (Greek)"] = "ESG.xhtml"
		bookFiles["Wisdom of Solomon"] = "WIS.xhtml"
		bookFiles["Sirach"] = "SIR.xhtml"
		bookFiles["Baruch"] = "BAR.xhtml"
		bookFiles["The Song of the Three Holy Children"] = "S3Y.xhtml"
		bookFiles["Susanna"] = "SUS.xhtml"
		bookFiles["Bel and the Dragon"] = "BEL.xhtml"
		bookFiles["Prayer of Manasses"] = "MAN.xhtml"
		bookFiles["1 Maccabees"] = "1MA.xhtml"
		bookFiles["2 Maccabees"] = "2MA.xhtml"
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




}

{
	if(!match($0, /<div class="bible-reference-heading">\s*\n\s*<span>\n\s*([^\n]+)\n/ ,matchArray)) #first grab the whole line describing the book (and possibly the chapter)
	{
		print "Error grabbing the book line."; exit 1
	}


	book = matchArray[1]; #doesn't actually hold the book yet, just using this as a temp variable

	match(book,/\s*([[:digit:]]+)\s*:\s*([[:digit:]]+)/,matchArray)


		chapter = matchArray[1]
		verse = matchArray[2]

		book = gensub("\\s*"chapter":"verse"\\s*","","1",book) #now trimming book

		if ((chapter ~ /^\s*$/) && (verse ~ /^\s*$/))
		{
			chapter = 0;
		}
	print book;
	print chapter;
	print verse;

#to do; get full verse
#get footnotes
#be careful distinguishing between full books (e.g. bell and the dragon) and those divided up into books and chapters

	if (!(pointer = match($0,/<div class="resourcetext">/)))
	{
		print "Error: could not find the text header in the xhtml."; exit 3
	}

	verseBlock = substr($0, pointer)
		verseBlock = gensub(/(s*\n.*$)|(^\s*)/,"","g",verseBlock) #the relevant part is all on one line, trim everything

		split(verseBlock, splitArray, /<[^>]+>/,sepsArray) #split by HTML tags


}


