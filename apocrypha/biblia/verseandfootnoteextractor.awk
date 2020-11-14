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
		OFS = FS #setting it to tab


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

#START WORK HERE 1

#returns simply the text associated with the footnote number, also properly adds xhtml tags for making hyperlinks
function getFootnoteText(footnoteNumber)
{
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




		print verseBlock




		split(verseBlock, splitArray, /<[^>]+>/,sepsArray) #split by HTML tags


		precedingText = ""
		numOfFootnotes = 0

#get footnotes
#be careful distinguishing between full books (e.g. bell and the dragon) and those divided up into books and chapters


		for (i=1; i<=length(splitArray); ++i)
		{
#START WORK HERE 2:
#you need to reset "preceding text" after you've recorded a footnote or when there's a book or chapter or verse switch
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

				else if (match(sepsArray[i-1], /<a data-datatype="bible\+kjv" data-reference="([^"]+)"/, matchArray))
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


			precedingText = precedingText splitArray[i]

		}



#footnotes array anatomy: footnotes[footnoteNumber][chapter][verse]["precedingWords"]["symbol"] = "actual footnote text"
#if chapter is 0, it means it's either a chapterless book or it's part of the prologue
#if chapter is 0 and verse is 0 it means it's a footnote in the title (see bel and the dragon)








}

END {
#START WORK HERE 3:
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

exit 0
}
