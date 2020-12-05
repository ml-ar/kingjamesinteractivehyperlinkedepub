#each line of the test input should be a biblia tag in the form <a data-reference="Zec1.17" data-datatype="bible+kjv" href="/reference/Zec1.17?resourceName=av1873" class="bibleref"> or something like that

function getProperHyperlinkOpeningBracket(bibliaTag,  hyperlinkArray,  linkBook,  linkBookFullName,  linkChapter,  linkVerse,  toReturn)
{
#START WORK HERE 1

	if (!(match(bibliaTag,/^\s*<a data-reference="([^"]+)"[^>]+>*$/, hyperlinkArray)))
	{
		print "ERROR: Could not parse " bibliaTag " into a hyperlink tag."; exit 6
	}

        match(hyperlinkArray[1], /([[:digit:]]?[A-Za-z]+)([[:digit:]]+)(\.([[:digit:]]+))?/, hyperlinkArray)
	linkBook = hyperlinkArray[1]

		linkChapter = hyperlinkArray[2]

		if (!(4 in hyperlinkArray) || !hyperlinkArray[4]) #4 is the index for the inner parenthesis in the right most of the regex in the most recent match
		{
			linkVerse = 0
		}
		else
		{
			linkVerse = hyperlinkArray[4]
		} 

#START WORK HERE: debug, make sure the book and the chapter are grabbed correctly
if (!(linkBook in bibliaAbbrev))
{
print "ERROR: inferred book " linkBook " from " bibliaTag " is not in the bibliaAbbrev array."; exit 7
}

linkBookFullName = bibliaAbbrev[linkBook]

if (!(linkBookFullName in bookFiles))
{
print "ERROR: book " linkBookFullName " is not in the bookFiles array."; exit 8
}

if (!(linkBookFullName in verseLabels))
{
print "ERROR: book " linkBookFullName " is not in the verseLabels array."; exit 8
}

toReturn = "<a href='"bookFiles[linkBookFullName]"#"verseLabels[linkBookFullName]""linkChapter"_"linkVerse"'>"

return toReturn;

}


BEGIN {
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

#multiple names
		bookFiles["Letter of Jeremiah"] = bookFiles["Baruch"]
		bookFiles["The Letter of Jeremiah"] = bookFiles["Baruch"]
		bookFiles["The Epistle of Jeremy"] = bookFiles["Baruch"]
		bookFiles["Epistle of Jeremy"] = bookFiles["Baruch"]

#multiple names
		bookFiles["The Song of the Three Holy Children"] = "S3Y.xhtml"
		bookFiles["3 Holy Children's Song"] = "S3Y.xhtml"
		bookFiles["Song of the 3 Holy Children"] = "S3Y.xhtml"
		bookFiles["Song of the Three Holy Children"] = "S3Y.xhtml"
		bookFiles["Prayer of Azariah"] = "S3Y.xhtml"
		bookFiles["The Prayer of Azariah"] = "S3Y.xhtml"

		bookFiles["Susanna"] = "SUS.xhtml"
#multiple names
		bookFiles["Bel and the Dragon"] = "BEL.xhtml"
		bookFiles["The Idol Bel and the Dragon"] = "BEL.xhtml"
#multiple names
		bookFiles["The Prayer of Manasses"] = "MAN.xhtml"
		bookFiles["Prayer of Manasses"] = "MAN.xhtml"
		bookFiles["The Prayer of Manasseh"] = "MAN.xhtml"
		bookFiles["Prayer of Manasseh"] = "MAN.xhtml"

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


		oneChapterBooks["Obadiah"] = "ja"
		oneChapterBooks["2 John"] = "ja"
		oneChapterBooks["3 John"] = "ja"
		oneChapterBooks["Jude"] = "ja"
		oneChapterBooks["Philemon"] = "ja"
		oneChapterBooks["Letter of Jeremiah"] = bookFiles["Baruch"]
		oneChapterBooks["The Letter of Jeremiah"] = bookFiles["Baruch"]
		oneChapterBooks["The Epistle of Jeremy"] = bookFiles["Baruch"]
		oneChapterBooks["Epistle of Jeremy"] = bookFiles["Baruch"]

		oneChapterBooks["3 Holy Children's Song"] = "S3Y.xhtml"
		oneChapterBooks["Song of the 3 Holy Children"] = "S3Y.xhtml"
		oneChapterBooks["Song of the Three Holy Children"] = "S3Y.xhtml"
		oneChapterBooks["Prayer of Azariah"] = "S3Y.xhtml"
		oneChapterBooks["The Prayer of Azariah"] = "S3Y.xhtml"

		oneChapterBooks["Bel and the Dragon"] = "BEL.xhtml"
		oneChapterBooks["The Idol Bel and the Dragon"] = "BEL.xhtml"

		oneChapterBooks["The Prayer of Manasses"] = "MAN.xhtml"
		oneChapterBooks["Prayer of Manasses"] = "MAN.xhtml"
		oneChapterBooks["The Prayer of Manasseh"] = "MAN.xhtml"
		oneChapterBooks["Prayer of Manasseh"] = "MAN.xhtml"

#All linked footnotes have a href like "#href="/reference/Eze28.13?resourceName=av1873". So for "Ezekiel" bibliaAbbrev["Eze"] would be "Ezekiel". The abbreviation is the element (for fast lookup)

		bibliaAbbrev["Ge"] = "Genesis"
		bibliaAbbrev["Ex"] = "Exodus"
		bibliaAbbrev["Le"] = "Leviticus"
		bibliaAbbrev["Nu"] = "Numbers"
		bibliaAbbrev["Dt"] = "Deuteronomy"
		bibliaAbbrev["Jos"] = "Joshua"
		bibliaAbbrev["Jdg"] = "Judges"
		bibliaAbbrev["Ru"] = "Ruth"
		bibliaAbbrev["1Sa"] = "1 Samuel"
		bibliaAbbrev["2Sa"] = "2 Samuel"
		bibliaAbbrev["1Ki"] = "1 Kings"
		bibliaAbbrev["2Ki"] = "2 Kings"
		bibliaAbbrev["1Ch"] = "1 Chronicles"
		bibliaAbbrev["2Ch"] = "2 Chronicles"
		bibliaAbbrev["Ezr"] = "Ezra"
		bibliaAbbrev["Ne"] = "Nehemiah"
		bibliaAbbrev["Es"] = "Esther"
		bibliaAbbrev["Job"] = "Job"
		bibliaAbbrev["Ps"] = "Psalms"
		bibliaAbbrev["Pr"] = "Proverbs"
		bibliaAbbrev["Ec"] = "Ecclesiastes"
		bibliaAbbrev["So"] = "Song of Solomon"
		bibliaAbbrev["Is"] = "Isaiah"
		bibliaAbbrev["Je"] = "Jeremiah"
		bibliaAbbrev["La"] = "Lamentations"
		bibliaAbbrev["Eze"] = "Ezekiel"
		bibliaAbbrev["Da"] = "Daniel"
		bibliaAbbrev["Ho"] = "Hosea"
		bibliaAbbrev["Joe"] = "Joel"
		bibliaAbbrev["Am"] = "Amos"
		bibliaAbbrev["Ob"] = "Obadiah"
		bibliaAbbrev["Jon"] = "Jonah"
		bibliaAbbrev["Mic"] = "Micah"
		bibliaAbbrev["Na"] = "Nahum"
		bibliaAbbrev["Hab"] = "Habakkuk"
		bibliaAbbrev["Zep"] = "Zephaniah"
		bibliaAbbrev["Hag"] = "Haggai"
		bibliaAbbrev["Zec"] = "Zechariah"
		bibliaAbbrev["Mal"] = "Malachi"
		bibliaAbbrev["1Esd"] = "1 Esdras"
		bibliaAbbrev["2Esd"] = "2 Esdras"
		bibliaAbbrev["Tob"] = "Tobit"
		bibliaAbbrev["Jdt"] = "Judith"
		bibliaAbbrev["Es"] = "Esther"
		bibliaAbbrev["Wis"] = "Wisdom of Solomon"
		bibliaAbbrev["Sir"] = "Sirach"
		bibliaAbbrev["Bar"] = "Baruch"


#multiple names
		bibliaAbbrev["SongThr"] = "Song of the 3 Holy Children"

		bibliaAbbrev["Sus"] = "Susanna"
#multiple names
		bibliaAbbrev["Bel"] = "Bel and the Dragon"
#multiple names
		bibliaAbbrev["PrMan"] = "Prayer of Manasseh"

		bibliaAbbrev["1Mac"] = "1 Maccabees"
		bibliaAbbrev["2Mac"] = "2 Maccabees"
		bibliaAbbrev["Mt"] = "Matthew"
		bibliaAbbrev["Mk"] = "Mark"
		bibliaAbbrev["Lk"] = "Luke"
		bibliaAbbrev["Jn"] = "John"
		bibliaAbbrev["Ac"] = "Acts"
		bibliaAbbrev["Ro"] = "Romans"
		bibliaAbbrev["1Co"] = "1 Corinthians"
		bibliaAbbrev["2Co"] = "2 Corinthians"
		bibliaAbbrev["Ga"] = "Galatians"
		bibliaAbbrev["Eph"] = "Ephesians"
		bibliaAbbrev["Php"] = "Philippians"
		bibliaAbbrev["Col"] = "Colossians"
		bibliaAbbrev["1Th"] = "1 Thessalonians"
		bibliaAbbrev["2Th"] = "2 Thessalonians"
		bibliaAbbrev["1Ti"] = "1 Timothy"
		bibliaAbbrev["2Ti"] = "2 Timothy"
		bibliaAbbrev["Tt"] = "Titus"
		bibliaAbbrev["Phm"] = "Philemon"
		bibliaAbbrev["Heb"] = "Hebrews"
		bibliaAbbrev["Jas"] = "James"
		bibliaAbbrev["1Pe"] = "1 Peter"
		bibliaAbbrev["2Pe"] = "2 Peter"
		bibliaAbbrev["1Jn"] = "1 John"
		bibliaAbbrev["2Jn"] = "2 John"
		bibliaAbbrev["3Jn"] = "3 John"
		bibliaAbbrev["Jud"] = "Jude"
		bibliaAbbrev["Re"] = "Revelation"

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

}


{
print getProperHyperlinkOpeningBracket($0)
}
