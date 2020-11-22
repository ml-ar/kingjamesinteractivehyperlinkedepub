#this removes all double spaces between word characters

{
print gensub(/(\w)\s{2,}(\w)/, "\\1 \\2", "g")
	}

