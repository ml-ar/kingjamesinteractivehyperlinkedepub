#feed a list of footnotes into this script to correct discrepancies
#rememeber to be careful when correcting multiple discrepancies in the same line! Don't find and replace twice


#call this if you have multiple footnotes for the same chapter and verse and need to correct all the discrepancies at once
#all are self explanatory, except 
#lineToCorrect: this is the preceding text for the footnote
#fullCorrectLine: this is the full verse line, copied and pasted from a reference so you know it's right
function correctAllVerses(book, chapter, verse, lineToCorrect, fullCorrectLine,  splitLineToCorrect,  splitFullCorrectLine,  toReturn,  i)
{
	toReturn = ""
		patsplit(fullCorrectLine, splitFullCorrectLine,/\S+\s*/)
		patsplit(lineToCorrect, splitLineToCorrect,/\S+\s*/)
					for (i in splitLineToCorrect) #the idea here is you go chunk by chunk, except replace each chunk in the original with the reference
					{
						toReturn = toReturn splitFullCorrectLine[i]
					}





	return toReturn
}


BEGIN {
FS = "\t"
OFS = "\t"
}

{
toReturn = $0
}


#Susanna


/^Susanna/{
toReturn = gensub(/The History of Susanna\.\s*/,"","g", toReturn)
toReturn = gensub(/Then Susanna sighed, and said, I am straited on every side: for if I do this thing,/,"Then Susanna sighed, and said, I am straitened on every side: for if I do this thing,","g", toReturn)
toReturn = gensub(/So when the servants of the house heard the cry in the garden, they rushed in at a/,"So when the servants of the house heard the cry in the garden, they rushed in at the","g",toReturn)
toReturn = gensub(/Then the assembly believed them, as those that were/,"Then the assembly believed them as those that were","g",toReturn)
toReturn = gensub(/So he standing in the midst of them, said, Are ye such fools, ye sons of Israel, that without examination or knowledge of the truth ye have condemned/,"So he standing in the midst of them said, Are ye such fools, ye sons of Israel, that without examination or knowledge of the truth ye have condemned","g",toReturn)
toReturn = gensub(/for thou hast pronounced false judgment, and hast condemned the innocent, and hast let the guilty go free; albeit the Lord saith,/,"For thou hast pronounced false judgment and hast condemned the innocent and hast let the guilty go free; albeit the Lord saith,","g",toReturn)
toReturn = gensub(/So he put him aside, and commanded to bring the other, and said unto him, O thou seed of Canaan, and not of Juda, beauty hath deceived thee, and lust hath/,"So he put him aside, and commanded to bring the other, and said unto him, O thou seed of Chanaan, and not of Juda, beauty hath deceived thee, and lust hath","g",toReturn)
toReturn = gensub(/Now therefore tell me, Under what tree didst thou take them companying together\? Who answered, Under a\s+/,"Now therefore tell me, Under what tree didst thou take them companying together? Who answered, Under an ","g",toReturn)
toReturn = gensub(/And they arose against the two elders, \(for/,"And they arose against the two elders, for","g",toReturn)
}

/^1 Esdras/ {
	toReturn = gensub(/And in all Jewry they mourned for Josias, yea, Jeremie the prophet lamented for Josias, and the chief men with the women made lamentation for him unto this day: and this was given out/,"And in all Jewry they mourned for Josias, yea, Jeremy the prophet lamented for Josias, and the chief men with the women made lamentation for him unto this day: and this was given out","g",toReturn);
	toReturn = gensub(/Five and twenty year old was/,"Five and twenty years old was","g",toReturn)
		toReturn = gensub(/But in the time of Artaxerxes king of the Persians, Belemus, and Mithridates, and Tabellius, and/,"But in the time of Artexerxes king of the Persians Belemus, and Mithridates, and Tabellius, and","g",toReturn)
		toReturn = gensub(/To king Artaxerxes our lord, Thy servants, Rathumus the/,"To king Artexerxes our lord, Thy servants, Rathumus the","g,",toReturn)
		toReturn = gensub(/Then king Artexerxes his letters being read, Rathumus, and Semellius the scribe, and the rest that were in commission with them, removing in haste towards Jerusalem with a troop of horsemen and/,"Then king Artexerxes his letters being read, Rathumus, and Semellius the scribe, and the rest that were in commission with them, removing in haste toward Jerusalem with a troop of horsemen and","g,",toReturn)
		toReturn = gensub(/as, to be clothed in purple, to drink in gold, and to sleep upon gold, and a chariot with bridles of gold, and a headtire of/,"As, to be clothed in purple, to drink in gold, and to sleep upon gold, and a chariot with bridles of gold, and an headtire of","g,",toReturn)
		toReturn = gensub(/O ye men, do not men excel in strength, that/,"O ye men, do not men excel in strength that","g,",toReturn)
		toReturn = gensub(/Then said the king unto him, Ask what thou will more/,"Then said the king unto him, Ask what thou wilt more","g,",toReturn)
		toReturn = gensub(/He wrote letters also unto the lieutenants that were in Coelosyria and Phenice, and unto them in Libanus, that they should bring/,"He wrote letters also unto the lieutenants that were in Celosyria and Phenice, and unto them in Libanus, that they should bring","g,",toReturn)
		toReturn = gensub(/And Darius sent with them a thousand horsemen, till they had brought them back to Jerusalem safely, and with musical instruments,/,"And Darius sent with them a thousand horsemen, till they had brought them back to Jerusalem safely, and with musical instruments","g,",toReturn)
		toReturn = gensub(/And these are the names of the men which went up, according to their families amongst their tribes, after/,"And these are the names of the men which went up, according to their families among their tribes, after","g,",toReturn)
		toReturn = gensub(/The priests, the sons of Phinees the son of Aaron: Jesus the son of Josedec, the son of Saraias, and Joacim the son of Zorobabel, the son of Salathiel of the house of David,/,"The priests, the sons of Phinees the son of Aaron: Jesus the son of Josedec, the son of Saraias, and Joacim the son of Zorobabel, the son of Salathiel, of the house of David,","g,",toReturn)
		toReturn = gensub(/And they returned unto Jerusalem, and to the other parts of Jewry, every man to his own city, who came with Zorobabel, with Jesus, Nehemias, and Zacharias, and Resaias, Enenius, Mardocheus, Beelsarus,/,"And they returned unto Jerusalem, and to the other parts of Jewry, every man to his own city, who came with Zorobabel, with Jesus, Nehemias, and Zacharias, and Reesaias, Enenius, Mardocheus. Beelsarus,","g,",toReturn)
		toReturn = gensub(/the sons of The sons of Elam, a thousand two hundred fifty and four: the sons of Zathui, nine hundred forty and five: the sons of/,"The sons of Elam, a thousand two hundred fifty and four: the sons of Zathui, nine hundred forty and five: the sons of","g,",toReturn)
		toReturn = gensub(/the sons of Elam, a thousand two hundred fifty and four: the sons of Zathui, nine hundred forty and five:/,"The sons of Elam, a thousand two hundred fifty and four: the sons of Zathul, nine hundred forty and five:","g",toReturn)
		toReturn=gensub(/the sons of Adonican, six hundred sixty and seven: the sons of/,"The sons of Adonikam, six hundred sixty and seven: the sons of","1",toReturn)
		toReturn=gensub(/they of Chadias and Ammidioi, four hundred twenty and two: they of/,"They of Chadias and Ammidoi, four hundred twenty and two: they of","1",toReturn)
		toReturn=gensub(/The priests: the sons of Jeddu, the son of Jesus, among the sons of Sanasib, nine hundred seventy and two: the sons of/,"The priests: the sons of Jeddu, the son of Jesus among the sons of Sanasib, nine hundred seventy and two: the sons of","1",toReturn)

#mass changes
		if ($2 == "2")
		{
			if ($3 == "30")
			{
				$5 = correctAllVerses($1, $2, $3, $5, "Then king Artexerxes his letters being read, Rathumus, and Semellius the scribe, and the rest that were in commission with them, removing in haste toward Jerusalem with a troop of horsemen and a multitude of people in battle array, began to hinder the builders; and the building of the temple in Jerusalem ceased until the second year of the reign of Darius king of the Persians.")
					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

			}
		}
		else if ($2 == "5")
		{
			if ($3 == "31")

			{
				$5 = correctAllVerses($1, $2, $3, $5, "The sons of Airus, the sons of Daisan, the sons of Noeba, the sons of Chaseba, the sons of Gazera, the sons of Azia, the sons of Phinees, the sons of Azare, the sons of Bastai, the sons of Asana, the sons of Meani, the sons of Naphisi, the sons of Acub, the sons of Acipha, the sons of Assur, the sons of Pharacim, the sons of Basaloth, ")
					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "33")
			{
				$5 = correctAllVerses($1, $2, $3, $5, "The sons of the servants of Solomon: the sons of Azaphion, the sons of Pharira, the sons of Jeeli, the sons of Lozon, the sons of Israel, the sons of Sapheth, ")
					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

			}
		}


}


{
print toReturn;
}
