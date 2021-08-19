#feed a list of footnotes into this script to correct discrepancies
#rememeber to be careful when correcting multiple discrepancies in the same line! Don't find and replace twice


#call this if you have multiple footnotes for the same chapter and verse and need to correct all the discrepancies at once
#all are self explanatory, except 
#lineToCorrect: this is the preceding text for the footnote
#fullCorrectLine: this is the full verse line, copied and pasted from a reference so you know it's right
function correctAllVerses(lineToCorrect, fullCorrectLine,  splitLineToCorrect,  splitFullCorrectLine,  toReturn,  i)
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
		toReturn=gensub(/So of Israel, from them of twelve years old and upward, they were all in number forty thousand, besides/,"So of Israel, from them of twelve years old and upward, they were all in number forty thousand, beside","1",toReturn)
		toReturn=gensub(/Then stood up Jesus the son of Josedec, and his brethren the priests, and/,"Then stood up Jesus the son of Josedec, and his brethren the priests and","1",toReturn)
		toReturn=gensub(/For we likewise, as you, do obey your Lord, and do sacrifice unto him from the days of/,"For we likewise, as ye, do obey your Lord, and do sacrifice unto him from the days of","1",toReturn)
		toReturn=gensub(/To king Darius, greeting. Let all things be known unto our lord the king, that being come into the country of Judea, and entered into the city of Jerusalem, we found in the city of Jerusalem the/,"Let all things be known unto our lord the king, that being come into the country of Judea, and entered into the city of Jerusalem we found in the city of Jerusalem the","1",toReturn)
		toReturn=gensub(/In the first year of the reign of Cyrus, king Cyrus commanded that the house of the Lord at Jerusalem should be built again, where they do sacrifice/,"In the first year of the reign of Cyrus king Cyrus commanded that the house of the Lord at Jerusalem should be built again, where they do sacrifice","1",toReturn)
		toReturn=gensub(/There went up with him also certain of the children of Israel, of the priest, of the Levites, of the holy singers, porters, and/,"There went up with him also certain of the children of Israel, of the priest of the Levites, of the holy singers, porters, and","1",toReturn)
		toReturn=gensub(/King Artaxerxes unto Esdras the priest and/,"King Artexerxes unto Esdras the priest and","1",toReturn)
		toReturn=gensub(/and that whosoever met not there within two or three days, according as the elders that bare rule appointed, their cattle should be seized to the use of the temple, and himself/,"And that whosoever met not there within two or three days according as the elders that bare rule appointed, their cattle should be seized to the use of the temple, and himself","1",toReturn)

#mass changes
		if ($2 == "2")
		{
			if ($3 == "30")
			{
				$5 = correctAllVerses($5, "Then king Artexerxes his letters being read, Rathumus, and Semellius the scribe, and the rest that were in commission with them, removing in haste toward Jerusalem with a troop of horsemen and a multitude of people in battle array, began to hinder the builders; and the building of the temple in Jerusalem ceased until the second year of the reign of Darius king of the Persians.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}

		}
		else if ($2 == "5")
		{
			if ($3 == "31")

			{
				$5 = correctAllVerses($5, "The sons of Airus, the sons of Daisan, the sons of Noeba, the sons of Chaseba, the sons of Gazera, the sons of Azia, the sons of Phinees, the sons of Azare, the sons of Bastai, the sons of Asana, the sons of Meani, the sons of Naphisi, the sons of Acub, the sons of Acipha, the sons of Assur, the sons of Pharacim, the sons of Basaloth, ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "33")
			{
				$5 = correctAllVerses($5, "The sons of the servants of Solomon: the sons of Azaphion, the sons of Pharira, the sons of Jeeli, the sons of Lozon, the sons of Israel, the sons of Sapheth, ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "55")
			{
				$5 = correctAllVerses($5, "Unto them of Zidon also and Tyre they gave carrs, that they should bring cedar trees from Libanus, which should be brought by floats to the haven of Joppa, according as it was commanded them by Cyrus king of the Persians.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

			}

		}
		else if ($2 == "6")
		{
			if ($3 == "1")
			{
				$5 = correctAllVerses($5, "Now in the second year of the reign of Darius Aggeus and Zacharias the son of Addo, the prophets, prophesied unto the Jews in Jewry and Jerusalem in the name of the Lord God of Israel, which was upon them.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "8")
			{
				$5 = correctAllVerses($5, "Let all things be known unto our lord the king, that being come into the country of Judea, and entered into the city of Jerusalem we found in the city of Jerusalem the ancients of the Jews that were of the captivity ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "18")
			{
				$5 = correctAllVerses($5, "And the holy vessels of gold and of silver, that Nabuchodonosor had carried away out of the house at Jerusalem, and had set them in his own temple those Cyrus the king brought forth again out of the temple at Babylon, and they were delivered to Zorobabel and to Sanabassarus the ruler, ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
		}
		else if ($2 == "7")
		{
			if ($3 == "9")
			{
				$5 = correctAllVerses($5, "The priests also and the Levites stood arrayed in their vestments, according to their kindreds, in the service of the Lord God of Israel, according to the book of Moses: and the porters at every gate.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "15")
			{
				$5 = correctAllVerses($5, "For that he had turned the counsel of the king of Assyria toward them, to strengthen their hands in the works of the Lord God of Israel.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}

		}
		else if ($2 == "8")
		{
			if ($3 == "1")
			{
				$5 = correctAllVerses($5, "And after these things, when Artexerxes the king of the Persians reigned came Esdras the son of Saraias, the son of Ezerias, the son of Helchiah, the son of Salum, ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "2")
			{
				$5 = correctAllVerses($5, "The son of Sadduc, the son of Achitob, the son of Amarias, the son of Ezias, the son of Meremoth, the son of Zaraias, the son of Savias, the son of Boccas, the son of Abisum, the son of Phinees, the son of Eleazar, the son of Aaron the chief priest.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "6")
			{
				$5 = correctAllVerses($5, "In the seventh year of the reign of Artexerxes, in the fifth month, this was the king’s seventh year; for they went from Babylon in the first day of the first month, and came to Jerusalem, according to the prosperous journey which the Lord gave them.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "8")
			{
				$5 = correctAllVerses($5, "Now the copy of the commission, which was written from Artexerxes the king, and came to Esdras the priest and reader of the law of the Lord, is this that followeth; ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
else if ($3 == "9")
			{
				$5 = correctAllVerses($5, "King Artexerxes unto Esdras the priest and reader of the law of the Lord sendeth greeting: ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
else if ($3 == "19")
			{
				$5 = correctAllVerses($5, "And I king Artexerxes have also commanded the keepers of the treasures in Syria and Phenice, that whatsoever Esdras the priest and the reader of the law of the most high God shall send for, they should give it him with speed, ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "35")
			{
				$5 = correctAllVerses($5, "Of the sons of Joab, Abadias son of Jezelus, and with him two hundred and twelve men: ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "39")
			{
				$5 = correctAllVerses($5, "Of the sons of Adonikam the last, and these are the names of them, Eliphalet, Jewel, and Samaias, and with them seventy men: ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "49")
			{
				$5 = correctAllVerses($5, "And of the servants of the temple whom David had ordained, and the principal men for the service of the Levites to wit, the servants of the temple two hundred and twenty, the catalogue of whose names were shewed.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "67")
			{
				$5 = correctAllVerses($5, "And they delivered the king’s commandments unto the king’s stewards’ and to the governors of Celosyria and Phenice; and they honoured the people and the temple of God.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}

			else if ($3 == "69")
			{
				$5 = correctAllVerses($5, "The nation of Israel, the princes, the priests and Levites, have not put away from them the strange people of the land, nor the pollutions of the Gentiles to wit, of the Canaanites, Hittites, Pheresites, Jebusites, and the Moabites, Egyptians, and Edomites.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}

		}
		else if ($2 == "9")
		{


			if ($3 == "19")
			{
				$5 = correctAllVerses($5, "Of the sons of Jesus the son of Josedec, and his brethren; Matthelas and Eleazar, and Joribus and Joadanus.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "20")
			{
				$5 = correctAllVerses($5, "And they gave their hands to put away their wives and to offer rams to make reconcilement for their errors.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "22")
			{
				$5 = correctAllVerses($5, "And of the sons of Phaisur; Elionas, Massias Israel, and Nathanael, and Ocidelus and Talsas.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "29")
			{
				$5 = correctAllVerses($5, "Of the sons of Babai; Johannes, and Ananias and Josabad, and Amatheis.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "40")
			{
				$5 = correctAllVerses($5, "So Esdras the chief priest brought the law unto the whole multitude from man to woman, and to all the priests, to hear law in the first day of the seventh month.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "48")
			{
				$5 = correctAllVerses($5, "Also Jesus, Anus, Sarabias, Adinus, Jacubus, Sabateas, Auteas, Maianeas, and Calitas, Asrias, and Joazabdus, and Ananias, Biatas, the Levites, taught the law of the Lord, making them withal to understand it.")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
			else if ($3 == "49")
			{
				$5 = correctAllVerses($5, "Then spake Attharates unto Esdras the chief priest. and reader, and to the Levites that taught the multitude, even to all, saying, ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
		}


}


{
print toReturn;
}
