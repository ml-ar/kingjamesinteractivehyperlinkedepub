#this program takes all processed footnotes in an xhtml (<span class="ft">footnote text</span>) and makes hyperlinks for cross references:

#for example:

#<span class="ft">Ps. 33. 6. &amp; 136. 5. Acts 14. 15. &amp; 17. 24. Heb. 11. 3.</span>

#should become:

#<span class="ft"><li><a href='PSA.xhtml#PS33_6'>Ps. 33. 6.</a></li> &amp; <li><a href='PSA.xhtml#PS136_5'>136. 5.</a></li> <li><a href='ACT.xhtml#AC14_15'>Acts 14. 15.</a></li> &amp; <li><a href='ACT.xhtml#AC17_24'>Acts 17. 24.</a></li> <li><a href='HEB.xhtml#HB11_3'>Heb. 11. 3.</a></li></span>

#ERROR CODES:
#1: Could not match the end of the line and chapter and verse of the footnote label at the end
#2: Could not parse out exactly the chapter and verse from the footnote label at the end
#3: Could not get the current book from the XHTML

BEGIN {


#bookRegex holds the regexes for the book, which should match the text of a marginal reference.

#Old testament
	bookRegex["Genesis"] = "(Gen\\.?)"
		bookRegex["Exodus"] = "(Ex\\.?)"
		bookRegex["Leviticus"] = "(Lev\\.?)"
		bookRegex["Numbers"] = "(Num\\.?)"
		bookRegex["Deuteronomy"] = "(Deut\\.?)"
		bookRegex["Joshua"] = "(Josh)"
		bookRegex["Judges"] = "(Judg.)"
		bookRegex["Ruth"] = "(Ruth)"
		bookRegex["1 Samuel"] = "(1 Sam\\.?)"
		bookRegex["2 Samuel"] = "(2 Sam\\.?)"
		bookRegex["1 Kings"] = "(1 Kin\\.?)|(1 Kings)"
		bookRegex["2 Kings"] = "(2 Kin\\.?)|(2 Kings)"
		bookRegex["1 Chronicles"] = "(1 Chr\\.?)"
		bookRegex["2 Chronicles"] = "(2 Chr\\.?)"
		bookRegex["Ezra"] = "(Ezra)"
		bookRegex["Nehemiah"] = "(Neh\\.?)"
		bookRegex["Esther"] = "(Esth\\.?)"
		bookRegex["Psalms"] = "(Ps\\.?)"
		bookRegex["Proverbs"] = "(Prov\\.?)"
		bookRegex["Ecclesiastes"] "(Eccles\\.?)"
		bookRegex["Job"] = "(Job)"
		bookRegex["Isaiah"] = "(Is\\.?)|(Isai\\.?)"
		bookRegex["Jeremiah"] = "(Jer\\.?)"
		bookRegex["Lamentations"] = "(Lam\\.?)"
		bookRegex["Ezekiel"] = "(Ezek?\\.?)" #haven't confirmed simply "Eze" as a note but there is likely nothing else like that
		bookRegex["Daniel"] = "(Dan\\.?)"
		bookRegex["Hosea"] = "(Hos\\.?)"
		bookRegex["Joel"] = "(Joel)"
		bookRegex["Amos"] = "(Amos)"
		bookRegex["Obadiah"] = "(Obad\\.?)"
		bookRegex["Jonah"] = "(Jonah)"
		bookRegex["Micah"] = "(Mic\\.?)"
		bookRegex["Nahum"] = "(Nah\\.?)"
		bookRegex["Habakkuk"] = "(Hab\\.?)"
		bookRegex["Zephaniah"] = "(Zeph\\.?)"
		bookRegex["Haggai"] = "(Hag\\.?)"
		bookRegex["Zechariah"] = "(Zech\\.?)"
		bookRegex["Malachi"] = "(Mal\\.?)"

#Apocrypha
		bookRegex["1 Esdras"] = "(1 Esd\\.?)"
		bookRegex["2 Esdras"] = "(2 Esd\\.?)"
		bookRegex["Tobit"] = "(Tob\\.?)"
		bookRegex["Judith"] = "(Judith)"
		bookRegex["Wisdom"] = "(Wisd\\.?)"
		bookRegex["Sirach"] = "(Ecclus\\.?)"
		bookRegex["Baruch"] = "(Bar\\.?)"
		bookRegex["Ecclesiasticus"] = bookRegex["Sirach"] #sirach and ecclesiasticus is the same
		bookRegex["1 Maccabees"] = "(1 Mac\\.?)"
		bookRegex["2 Maccabees"] = "(2 Mac\\.?)"

#New testament
		bookRegex["Matthew"] = "(Matt\\.?)"
		bookRegex["Mark"] = "(Mark)"
		bookRegex["Luke"] = "(Luke)"
		bookRegex["John"] = "(John)"
		bookRegex["Acts"] = "(Acts)"
		bookRegex["Romans"] = "(Rom\\.?)"
		bookRegex["1 Corinthians"] = "(1 Cor\\.?)"
		bookRegex["2 Corinthians"] = "(2 Cor\\.?)"
		bookRegex["Galatians"] = "(Gal\\.?)"
		bookRegex["Ephesians"] = "(Eph\\.?)"
		bookRegex["Philippians"] = "(Phil\\.?)"
		bookRegex["Colossians"] = "(Col\\.?)"
		bookRegex["1 Thessalonians"] = "(1 Thess\\.?)"
		bookRegex["2 Thessalonians"] = "(2 Thess\\.?)"
		bookRegex["1 Timothy"] = "(1 Tim\\.?)"
		bookRegex["2 Timothy"] = "(2 Tim\\.?)"
		bookRegex["Hebrews"] = "(Heb\\.?)"
		bookRegex["James"] = "(James)"
		bookRegex["1 Peter"] = "(1 Pet\\.?)"
		bookRegex["2 Peter"] = "(2 Pet\\.?)"
		bookRegex["1 John"] = "(1 John)"
		bookRegex["Jude"] = "(Jude)"
		bookRegex["Revelation"] = "(Rev\\.?)"


#Verse labels refer to the letters before the verse numbers in the href, e.g., GEN1_1, verselabel is GEN

#Old Testament
		verseLabels["Genesis"] = "GN"
		verseLabels["Exodus"] = "EX"
		verseLabels["Leviticus"] = "LV"
		verseLabels["Numbers"] = "NM"
		verseLabels["Deuteronomy"] = "DT"
		verseLabels["Joshua"] = "JS"
		verseLabels["Judges"] = "JD"
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
		verseLabels["Psalms"] = "PS"
		verseLabels["Proverbs"] = "PR"
		verseLabels["Ecclesiastes"] = "EC"
		verseLabels["Job"] = "JB"
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
		verseLabels["Wisdom"] = "WS"
		verseLabels["Sirach"] = "SR"
		verseLabels["Baruch"] = "BR"
		verseLabels["Ecclesiasticus"] = verseLabels["Sirach"] #sirach and ecclesiasticus is the same
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
		verseLabels["Philemon"] = "PM"
		verseLabels["Hebrews"] = "HB"
		verseLabels["James"] = "JM"
		verseLabels["1 Peter"] = "P1"
		verseLabels["2 Peter"] = "P2"
		verseLabels["1 John"] = "J1"
		verseLabels["Jude"] = "JD"
		verseLabels["Revelation"] = "RV"

		bookRegexCombined = bookRegex["Genesis"]

		for (i in bookRegex)
		{
			bookRegexCombined = bookRegexCombined "|(" bookRegex[i]
		}

}


/a href='index.xhtml'/ {

	match($0,/<li>\s*<a href='index.xhtml'>\s*([^<\n]+)<\/a>\s*<\/li>/, matchArray)

		if (!(1 in matchArray))
		{
			print "Error parsing the current book."; exit 3
		}


#Error checking

	if (!(matchArray[1] in bookRegex))
	{
		print "Did not find the book " matchArray[1] " in the bookRegex array. Did you anticipate this?" | "cat 1>&2"
	}

	if (!(matchArray[1] in verseLabels))
	{
		print "Did not find the book " matchArray[1] " in the verseLabels array. Did you anticipate this?" | "cat 1>&2"
	}

	currentBook = matchArray[1]
}


/<aside epub:type='footnote'/ {

if (!match($0, /([[:digit:]]+)\s*\.\s*([[:digit:]]+)\s*<\/a>\s*$/, matchArray))
{
	print "Error matching chapter and verse in epub label."; exit 1
}

if (!(1 in matchArray) || !(2 in matchArray))
{
print "Error matching the numbers of the chapter and verse exactly in the epub label."; exit 2;
}


}


/<span class="ft">/ {

#remember that if it's "ch" it refers to the book in question


#Tricky ones:
#ver. 56. &amp; 59.
#ch. 12. 3. &amp; 15. 18. &amp; 22. 18.
#ch. 16. 14. &amp; 25. 11.
#footnote_nt10852 (text is simply "jude 9")


#print the appropriate line
next;
}

{
print $0;
}
