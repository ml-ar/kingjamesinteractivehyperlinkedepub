#for an input html, this program outputs the following tab-seperated data:

#book	chapter	verse	full verse text (italics are surrounded thus <i>text</i>)	footnote symbol	footnote text	preceding verse text (italics preserved)

#the last four can be repeated for as many footnotes as necessary
#if chapter is 0, that means it's just verses


BEGIN {
RS = "^$"
OFS = "	"
}

{
match($0, /<div class="bible-reference-heading">\s*\n\s*<span>\n\s*([^\n]+)\n/ ,matchArray) #first grab the whole line describing the book (and possibly the chapter)

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

}


