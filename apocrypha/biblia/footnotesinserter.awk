#this awk program takes as an input a tab seperated file in the following form:

#Book	Chapter	Verse	Footnote number for that verse	Preceding text	footnote symbol	footnote text

BEGIN {
FS = "\t"
}

{

if (!$1 || (!$2 && $2 != 0) || (!$3 && $3 != 0) || !$4 || !$6 || !$7)
{
print "ERROR: badly formated line: \n " $0; exit 1

}	
book = $1
chapter = $2
verse = $3
footnoteNumber = $4
precedingText = $5
footnoteSymbol = $6
footnoteText = $7



}
