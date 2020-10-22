#this program takes all processed footnotes in an xhtml (<span class="ft">footnote text</span>) and makes hyperlinks for cross references:

#for example:

#<span class="ft">Ps. 33. 6. &amp; 136. 5. Acts 14. 15. &amp; 17. 24. Heb. 11. 3.</span>

#should become:

#<span class="ft"><li><a href='PSA.xhtml#PS33_6'>Ps. 33. 6.</a></li> &amp; <li><a href='PSA.xhtml#PS136_5'>136. 5.</a></li> <li><a href='ACT.xhtml#AC14_15'>Acts 14. 15.</a></li> &amp; <li><a href='ACT.xhtml#AC17_24'>Acts 17. 24.</a></li> <li><a href='HEB.xhtml#HB11_3'>Heb. 11. 3.</a></li></span>

BEGIN {


#bookRegex holds the regexes for the book, which should match the text of a marginal reference.

#Old testament
bookRegex["Deuteronomy"] = "(Deut\.?)"
bookRegex["Psalms"] = "(Ps\.?)"
bookRegex["Job"] = "Job"
bookRegex["Jeremiah"] = "(Jer\.?)"

#Apocrypha
bookRegex["2 Esdras"] = "(2 Esd\.?)"
bookRegex["Wisdom"] = "Wisd\.?"

#New testament
verseLabels["Matthew"] = "(Matt\.?)"
bookRegex["Acts"] = "(Acts)"
bookRegex["Hebrews"] = "(Heb\.?)"
bookRegex["1 Corinthians"] = "(1 Cor\.?)"
bookRegex["2 Corinthians"] = "(2 Cor\.?)"
bookRegex["Ephesians"] = "(Eph\.?)"
verseLabels["Colossians"] = "(Col\.?)"

#Verse labels refel to the letters before the verse numbers in the href, e.g., GEN1_1, verselabel is GEN

#Old Testament
verseLabels["Psalms"] = "PS"
verseLabels["Job"] = "JB"
verseLabels["Jeremiah"] = "JR"

#Apocrypha
verseLabels["2 Esdras"] = "E2"
verseLabels["Wisdom"] = "WS"

#New Testament
verseLabels["Matthew"] = "MT"
verseLabels["Acts"] = "AC"
verseLabels["Hebrews"] = "HB"
verseLabels["1 Corinthians"] = "C1"
verseLabels["2 Corinthians"] = "C2"
verseLabels["Ephesians"] = "EP"
verseLabels["Colossians"] = "CL"

}

/<span class="ft">/ {

#remember that if it's "ch" it refers to the book in question

}
