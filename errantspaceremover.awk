#this removes all double spaces between word characters and trailing whitespace at end of line

{
toPrint = gensub(/\s*$/,"","1")
toPrint = gensub(/(\w)\s{2,}(\w)/, "\\1 \\2", "g", toPrint)
print toPrint
}

