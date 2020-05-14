#this removes the different typeset of Jesus's speech, demarcated with <span class='wj'>; have to be careful to not remove internal spans


BEGIN {
spanClass = /<span class[^>]+>/
}


/<span class='wj'>/{
	toPrint = ""
internalSpans = 0
jesusFound = ""
		split($0, splitArray, /<span class[^>]+>|<\s*\/span>/,seps)
		for (i in splitArray)
		{
			toPrint = toPrint splitArray[i];
			if (i+1 in splitArray)
			{
				if (!jesusFound)
				{
					if (seps[i] ~ /class\s*=\s*'wj'/)

					{
						jesusFound = "ja"
					}
					else
					{
						toPrint = toPrint seps[i]
					}

				}
				else if (seps[i] ~ /'jw'/)
				{
					print "FATAL ERROR: Double Jesus found in " $0 | "cat 1>&2"; 
					exit 1;
				}

				else if (seps[i] ~ /<span\s*class/)
				{
					++internalSpans
 toPrint = toPrint seps[i]
				}
				else if (seps[i] ~ /span>/)
                                {
					if (internalSpans >= 1)
					{
						--internalSpans

							toPrint = toPrint seps[i]
					}
					else
					{
						jesusFound = ""
					}
				}
				else
				{
					print "FATAL ERROR: This condition shouldn't happen, it happened for " seps[i] " for " $0 | "cat 1>&2"; 
exit 1
				}
			}
		}

toPrint = gensub(/\s{2,}/," ","g",toPrint)
print toPrint







#	startingPoint = 1
#		embeddedSpanClassesSeen = 0
#		printMe = ""
#		while("true") #there may be multiple jesus quotes in one line
#		{
#
#			if (!(jesusStartPosition = match(substr($0, startingPoint), jesusSpanOpen, matchArray)))
#			{
#				break;
#			}
#			else #we have our Jesus span at location position
#			{
#				printMe = printMe substr($0, startingPoint, jesusStartPosition-2)
#					position = jesusStartPosition + startingPoint - 1
#					position--
#					printMe = printMe substr($0, startingPoint, position)
#					position = origPosition = position + length(matchArray[0]) + 1  #skipping over the jesusSpan
#					print substr($0, position)
#					while(pointer = match(substr($0, position), spanClassDeclaration, matchArray)) #we found an internal span
#
##START WORK HERE ALL FUCKITY
#					{
#						if (matchArray[0] !~ jesusSpan)
#						{
#							++embeddedSpanClassesSeen
#								position += pointer 
#						}
#						else
#						{
#							print "nope jesus"; exit 1
#						}                                                           
#					}
#				position = origPosition
##we've counted all the internal spans, now we must include (not skip over) all the span closes
#					while (pointer = match(substr($0, position), regexSpanClose, matchArray))
#					{
#
#					}
#
#			}     
#
#		}
#printMe = gensub(/ {2,}/," ", "g", printMe); #getting rid of double spaces
#print printMe; exit 1
		next;
}



{
print $0;
}

END {

}
