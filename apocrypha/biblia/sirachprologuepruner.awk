BEGIN {

RS = "^$"

}

{
toPrint = gensub(/manners to live after the law.\s*<\/span>\s*<\/p>[^\n]*\n/,"manners to live after the law. </span> </p> </div>\n","1");
toPrint = gensub(/<td id="footnote19">[^\n]*\n/,"","1",toPrint);
print toPrint;
}
