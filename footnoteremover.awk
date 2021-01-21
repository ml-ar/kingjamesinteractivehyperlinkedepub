#this awk script takes an xtml of a bible book found in the original epub (sha256 hash: d6d2508053aad53bc748c464a75147c800890be5f67165d3e9e6f6095190beda *eng-kjv.epub) and removes the footnotes

/^\s*((<aside epub:type='footnote')|(<span class="ft"))/{ #delete footnote at the bottom
	next;
}

{
print gensub(/(<a href='#FN[[:digit:]]+' epub:type='noteref' class='noteref'>[^<]+<\/a>\s*)/,"","g")
}
