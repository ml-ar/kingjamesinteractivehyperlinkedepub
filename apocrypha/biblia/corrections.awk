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
			if (i == 1 && splitLineToCorrect[i] !~ /[A-Z]|[a-z]/) #what if the preceding text is simply "("? This fixes that
			{
                           toReturn == ""
			}
			else
			{
				toReturn = toReturn splitFullCorrectLine[i]
			}
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
				$5 = correctAllVerses($5, "Then spake Attharates unto Esdras the chief priest, and reader, and to the Levites that taught the multitude, even to all, saying, ")

					toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
			}
		}


}

/^2 Esdras/ {
	if ($2 == "1")
	{


		if ($3 == "13")
		{
			$5 = correctAllVerses($5, "I led you through the sea and in the beginning gave you a large and safe passage; I gave you Moses for a leader, and Aaron for a priest.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "21")
		{
			$5 = correctAllVerses($5, "I divided among you a fruitful land, I cast out the Canaanites, the Pherezites, and the Philistines, before you: what shall I yet do more for you? saith the Lord.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "Thus saith the Almighty Lord, When ye were in the wilderness, in the river of the Amorites, being athirst, and blaspheming my name, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "26")
		{
			$5 = correctAllVerses($5, "Whensoever ye shall call upon me, I will not hear you: for ye have defiled your hands with blood, and your feet are swift to commit manslaughter.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "40")
		{
			$5 = correctAllVerses($5, "Nahum, and Abacuc, Sophonias, Aggeus, Zachary, and Malachy, which is called also an angel of the Lord.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "2")
	{


		if ($3 == "18")
		{
			$5 = correctAllVerses($5, "For thy help will I send my servants Esau and Jeremy, after whose counsel I have sanctified and prepared for thee twelve trees laden with divers fruits, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "3")
	{


		if ($3 == "17")
		{
			$5 = correctAllVerses($5, "And it came to pass, that when thou leadest his seed out of Egypt, thou broughtest them up to the mount Sinai.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "Thus infirmity was made permanent; and the law (also) in the heart of the people with the malignity of the root; so that the good departed away, and the evil abode still.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "4")
	{


		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "And said, Thy heart hath gone to far in this world, and thinkest thou to comprehend the way of the most High?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "How should thy vessel then be able to comprehend the way of the Highest, and, the world being now outwardly corrupted to understand the corruption that is evident in my sight?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "33")
		{
			$5 = correctAllVerses($5, "Then I answered and said, How, and when shall these things come to pass? wherefore are our years few and evil?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "5")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Nevertheless as coming the tokens, behold, the days shall come, that they which dwell upon earth shall be taken in a great number, and the way of truth shall be hidden, and the land shall be barren of faith.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "27")
		{
			$5 = correctAllVerses($5, "And among all the multitudes of people thou hast gotten thee one people: and unto this people, whom thou lovedst, thou gavest a law that is approved of all.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "52")
		{
			$5 = correctAllVerses($5, "Say unto her, Wherefore are unto they whom thou hast now brought forth like those that were before, but less of stature?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "6")
	{


		if ($3 == "17")
		{
			$5 = correctAllVerses($5, "And it happened, that when I had heard it I stood up upon my feet, and hearkened, and, behold, there was a voice that spake, and the sound of it was like the sound of many waters.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "34")
		{
			$5 = correctAllVerses($5, "And hasten not with the times that are past, to think vain things, that thou mayest not hasten from the latter times.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "58")
		{
			$5 = correctAllVerses($5, "But we thy people, whom thou hast called thy firstborn, thy only begotten, and thy fervent lover, are given into their hands.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "7")
	{


		if ($3 == "68")
		{
			$5 = correctAllVerses($5, "And he pardoneth; for if he did not so of his goodness, that they which have committed iniquities might be eased of them, the ten thousandth part of men should not remain living.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "8")
	{


		if ($3 == "22")
		{
			$5 = correctAllVerses($5, "Whose service is conversant in wind and fire; whose word is true, and sayings constant; whose commandment is strong, and ordinance fearful; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "45")
		{
			$5 = correctAllVerses($5, "Be not wroth with us but spare thy people, and have mercy upon thine own inheritance: for thou art merciful unto thy creature.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "59")
		{
			$5 = correctAllVerses($5, "For as the things aforesaid shalt receive you, so thirst and pain are prepared for them: for it was not his will that men should come to nought: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "9")
	{


		if ($3 == "6")
		{
			$5 = correctAllVerses($5, "Even so the times also of the Highest have plain beginnings in wonder and powerful works, and endings in effects and signs.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "And they that have loathed my law, while they had yet liberty, and, when as yet place of repentance was open unto them, understood not, but despised it; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "13")
		{
			$5 = correctAllVerses($5, "And therefore be thou not curious how the ungodly shall be punished, and when: but enquire how the righteous shall be saved, whose the world is, and for whom the world is created.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "38")
		{
			$5 = correctAllVerses($5, "And when I spake these things in my heart, I looked back with mine eyes, and upon the right side I saw a woman, and, behold, she mourned and wept with a loud voice, and was much grieved in heart, and her clothes were rent, and she had ashes upon her head. ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}


	}
	else if ($2 == "10")
	{


		if ($3 == "10")
		{
			$5 = correctAllVerses($5, "For out of her came all at the first, and out of her shall all others come, and, behold, they walk almost all into destruction, and a multitude of them is utterly rooted out.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "27")
		{
			$5 = correctAllVerses($5, "And I looked, and, behold, the woman appeared unto me no more, but there was a city builded, and a large place shewed itself from the foundations: then was I afraid, and cried with a loud voice, and said, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "30")
		{
			$5 = correctAllVerses($5, "And, lo, I lay as one that had been dead, and mine understanding was taken from me: and he took me by the right hand, and comforted me, and set me upon my feet, and said unto me, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "46")
		{
			$5 = correctAllVerses($5, "But after thirty years Solomon builded the city and offered offerings: and then bare the barren a son.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "49")
		{
			$5 = correctAllVerses($5, "And, behold, thou sawest her likeness, and because she mourned for her son, thou begannest to comfort her: and of these things which have chanced, these are to be opened unto thee.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "55")
		{
			$5 = correctAllVerses($5, "And therefore fear not, let not thine heart be affrighted, but go thy way in, and see the beauty and greatness of the building, as much as thine eyes be able to see: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "59")
		{
			$5 = correctAllVerses($5, "And so shall the Highest shew thee visions of the high things, which the most High will do unto them that dwell upon the earth in the last days. So I slept that night and another, like as he commanded me.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}


	}
	else if ($2 == "11")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Then saw I a dream, and, behold, there came up from the sea an eagle, which had twelve feathered wings, and three heads.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "And I numbered her contrary feathers, and, behold, there were eight of them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "12")
		{
			$5 = correctAllVerses($5, "And I looked, and, behold, on the right side there arose one feather, and reigned over all the earth; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "20")
		{
			$5 = correctAllVerses($5, "Then I beheld, and, lo, in process of time the feathers that followed stood up upon the right side, that they might rule also; and some of them ruled, but within a while they appeared no more: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "After this I looked, and, behold, the twelve feathers appeared no more, nor the two little feathers: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "25")
		{
			$5 = correctAllVerses($5, "And I beheld, and, lo, the feathers that were under the wing thought to set up themselves and to have the rule.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "26")
		{
			$5 = correctAllVerses($5, "And I beheld, and, lo, there was one set up, but shortly it appeared no more.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "28")
		{
			$5 = correctAllVerses($5, "And I beheld, and, lo, the two that remained thought also in themselves to reign: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "31")
		{
			$5 = correctAllVerses($5, "And, behold, the head was turned with them that were with it, and did eat up the two feathers under the wing that would have reigned.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "32")
		{
			$5 = correctAllVerses($5, "But this head put the whole earth in fear, and bare rule in it over all those that dwelt upon the earth with much oppression; and it had the governance of the world more than all the wings that had been.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "33")
		{
			$5 = correctAllVerses($5, "And after this I beheld, and, lo, the head that was in the midst suddenly appeared no more, like as the wings.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "45")
		{
			$5 = correctAllVerses($5, "And therefore appear no more, thou eagle, nor thy horrible wings, nor thy wicked feathers nor thy malicious heads, nor thy hurtful claws, nor all thy vain body: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "12")
	{


		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "And, behold, the head that remained and the four wings appeared no more, and the two went unto it and set themselves up to reign, and their kingdom was small, and fill of uproar.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "3")
		{
			$5 = correctAllVerses($5, "And I saw, and, behold, they appeared no more, and the whole body of the eagle was burnt so that the earth was in great fear: then awaked I out of the trouble and trance of my mind, and from great fear, and said unto my spirit, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "34")
		{
			$5 = correctAllVerses($5, "For the rest of my people shall he deliver with mercy, those that have been pressed upon my borders, and he shall make them joyful until the coming of the day of judgment, whereof I have spoken unto thee from the the beginning.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "13")
	{


		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "And, lo, there arose a wind from the sea, that it moved all the waves thereof.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "3")
		{
			$5 = correctAllVerses($5, "And I beheld, and, lo, that man waxed strong with the thousands of heaven: and when he turned his countenance to look, all the things trembled that were seen under him.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "13")
		{
			$5 = correctAllVerses($5, "And there came much people unto him, whereof some were glad, some were sorry, and some of them were bound, and other some brought of them that were offered: then was I sick through great fear, and I awaked, and said, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "14")
	{


		if ($3 == "4")
		{
			$5 = correctAllVerses($5, "And I sent him and led my people out of Egypt, and brought him up to the mount of where I held him by me a long season, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "18")
		{
			$5 = correctAllVerses($5, "For the time is fled far away, and leasing is hard at hand: for now hasteth the vision to come, which thou hast seen.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "33")
		{
			$5 = correctAllVerses($5, "And now are ye here, and your brethren among you.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "45")
		{
			$5 = correctAllVerses($5, "And it came to pass, when the forty days were filled, that the Highest spake, saying, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "47")
		{
			$5 = correctAllVerses($5, "For in them is the spring of understanding, the fountain of wisdom, and the stream of knowledge.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "15")
	{


		if ($3 == "40")
		{
			$5 = correctAllVerses($5, "The great and mighty clouds shall be puffed up full of wrath, and the star, that they may make all the earth afraid, and them that dwell therein; and they shall pour out over every high and eminent place an horrible star, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "53")
		{
			$5 = correctAllVerses($5, "If thou hadst not always slain my chosen, exalting the stroke of thine hands, and saying over their dead, when thou wast drunken, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "16")
	{


		if ($3 == "6")
		{
			$5 = correctAllVerses($5, "May any man drive away an hungry lion in the wood? or may any one quench the fire in stubble, when it hath begun to burn?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "Hear now these things and understand them, ye servants of the Lord.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "40")
		{
			$5 = correctAllVerses($5, "O my people, hear my word: make you ready to thy battle, and in those evils be even as pilgrims upon the earth.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "75")
		{
			$5 = correctAllVerses($5, "Be ye not afraid neither doubt; for God is your guide, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "77")
		{
			$5 = correctAllVerses($5, "Woe be unto them that are bound with their sins, and covered with their iniquities like as a field is covered over with bushes, and the path thereof covered with thorns, that no man may travel through!")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
}

/^Tobit/ {
	if ($2 == "1")
	{


		if ($3 == "3")
		{
			$5 = correctAllVerses($5, "I Tobit have walked all the days of my life in the ways of truth and justice, and I did many almsdeeds to my brethren, and my nation, who came with me to Nineve, into the land of the Assyrians.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "4")
		{
			$5 = correctAllVerses($5, "And when I was in mine own country, in the land of Israel being but young, all the tribe of Nephthali my father fell from the house of Jerusalem, which was chosen out of all the tribes of Israel, that all the tribes should sacrifice there, where the temple of the habitation of the most High was consecrated and built for all ages.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "20")
		{
			$5 = correctAllVerses($5,"Then all my goods were forcibly taken away, neither was there any thing left me, beside my wife Anna and my son Tobias.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "2")
	{


		if ($3 == "10")
		{
			$5 = correctAllVerses($5, "And I knew not that there were sparrows in the wall, and mine eyes being open, the sparrows muted warm dung into mine eyes, and a whiteness came in mine eyes: and I went to the physicians, but they helped me not: moreover Achiacharus did nourish me, until I went into Elymais.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "13")
		{
			$5 = correctAllVerses($5, "And when it was in my house, and began to cry, I said unto her, From whence is this kid? is it not stolen? render it to the owners; for it is not lawful to eat any thing that is stolen.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}


	}
	else if ($2 == "3")
	{


		if ($3 == "17")
		{
			$5 = correctAllVerses($5, "And Raphael was sent to heal them both, that is, to scale away the whiteness of Tobit’s eyes, and to give Sara the daughter of Raguel for a wife to Tobias the son of Tobit; and to bind Asmodeus the evil spirit; because she belonged to Tobias by right of inheritance. The selfsame time came Tobit home, and entered into his house, and Sara the daughter of Raguel came down from her upper chamber.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "4")
	{


		if ($3 == "14")
		{
			$5 = correctAllVerses($5, "Let not the wages of any man, which hath wrought for thee, tarry with thee, but give him it out of hand: for if thou serve God, he will also repay thee: be circumspect my son, in all things thou doest, and be wise in all thy conversation.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "16")
		{
			$5 = correctAllVerses($5, "Give of thy bread to the hungry, and of thy garments to them that are naked; and according to thine abundance give alms: and let not thine eye be envious, when thou givest alms.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "20")
		{
			$5 = correctAllVerses($5, "And now I signify this to they that I committed ten talents to Gabael the son of Gabrias at Rages in Media.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "5")
	{


		if ($3 == "13")
		{
			$5 = correctAllVerses($5, "Then Tobit said, Thou art welcome, brother; be not now angry with me, because I have enquired to know thy tribe and thy family; for thou art my brother, of an honest and good stock: for I know Ananias and Jonathas, sons of that great Samaias, as we went together to Jerusalem to worship, and offered the firstborn, and the tenths of the fruits; and they were not seduced with the error of our brethren: my brother, thou art of a good stock.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "6")
	{


		if ($3 == "13")
		{
			$5 = correctAllVerses($5, "Then the young man answered the angel, I have heard, brother Azarias that this maid hath been given to seven men, who all died in the marriage chamber.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "14")
		{
			$5 = correctAllVerses($5, "And now I am the only son of my father, and I am afraid, lest if I go in unto her, I die, as the other before: for a wicked spirit loveth her, which hurteth no body, but those which come unto her; wherefore I also fear lest I die, and bring my father’s and my mother’s life because of me to the grave with sorrow: for they have no other son to bury them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "7")
	{


		if ($3 == "3")
		{
			$5 = correctAllVerses($5, "And Raguel asked them, From whence are ye, brethren? To whom they said, We are of the sons of Nephthalim, which are captives in Nineve.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "8")
	{


		if ($3 == "6")
		{
			$5 = correctAllVerses($5, "Thou madest Adam, and gavest him Eve his wife for an helper and stay: of them came mankind: thou hast said, It is not good that man should be alone; let us make unto him an aid like unto himself.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "11")
	{


		if ($3 == "11")
		{
			$5 = correctAllVerses($5, "And took hold of his father: and he strake of the gall on his fathers’ eyes, saying, Be of good hope, my father.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "14")
		{
			$5 = correctAllVerses($5, "And he wept, and said, Blessed art thou, O God, and blessed is thy name for ever; and blessed are all thine holy angels: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "17")
		{
			$5 = correctAllVerses($5, "But Tobias gave thanks before them, because God had mercy on him. And when he came near to Sara his daughter in law, he blessed her, saying, Thou art welcome, daughter: God be blessed, which hath brought thee unto us, and blessed be thy father and thy mother. And there was joy among all his brethren which were at Nineve.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "13")
	{


		if ($3 == "6")
		{
			$5 = correctAllVerses($5, "If ye turn to him with your whole heart, and with your whole mind, and deal uprightly before him, then will he turn unto you, and will not hide his face from you. Therefore see what he will do with you, and confess him with your whole mouth, and praise the Lord of might, and extol the everlasting King. In the land of my captivity do I praise him, and declare his might and majesty to a sinful nation. O ye sinners, turn and do justice before him: who can tell if he will accept you, and have mercy on you?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "16")
		{
			$5 = correctAllVerses($5, "For Jerusalem shall be built up with sapphires and emeralds, and precious stone: thy walls and towers and battlements with pure gold.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "14")
	{


		if ($3 == "4")
		{
			$5 = correctAllVerses($5, "Go into Media my son, for I surely believe those things which Jonas the prophet spake of Nineve, that it shall be overthrown; and that for a time peace shall rather be in Media; and that our brethren shall lie scattered in the earth from that good land: and Jerusalem shall be desolate, and the house of God in it shall be burned, and shall be desolate for a time; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
}

/^Wisdom/ {

	if ($2 == "4")
	{


		if ($3 == "4")
		{
			$5 = correctAllVerses($5, "For though they flourish in branches for a time; yet standing not last, they shall be shaken with the wind, and through the force of winds they shall be rooted out.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "The imperfect branches shall be broken off, their fruit unprofitable, not ripe to eat, yea, meet for nothing.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "Yea speedily was he taken away, lest that wickedness should alter his understanding, or deceit beguile his soul.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "7")
	{


		if ($3 == "22")
		{
			$5 = correctAllVerses($5, "For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good quick, which cannot be letted, ready to do good, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "Kind to man, steadfast, sure, free from care, having all power, overseeing all things, and going through all understanding, pure, and most subtil, spirits.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "8")
	{


		if ($3 == "7")
		{
			$5 = correctAllVerses($5, "And if a man love righteousness her labours are virtues: for she teacheth temperance and prudence, justice and fortitude: which are such things, as en can have nothing more profitable in their life.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "17")
		{
			$5 = correctAllVerses($5, "Now when I considered these things in myself, and pondered them in my heart, how that to be allied unto wisdom is immortality; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "10")
	{


		if ($3 == "10")
		{
			$5 = correctAllVerses($5, "When the righteous fled from his brother’s wrath she guided him in right paths, shewed him the kingdom of God, and gave him knowledge of holy things, made him rich in his travels, and multiplied the fruit of his labours.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "11")
	{


		if ($3 == "6")
		{
			$5 = correctAllVerses($5, "For instead of a perpetual running river troubled with foul blood, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "9")
		{
			$5 = correctAllVerses($5, "For when they were tried albeit but in mercy chastised, they knew how the ungodly were judged in wrath and tormented, thirsting in another manner than the just.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
		else if ($3 == "14")
		{
			$5 = correctAllVerses($5, "For whom they respected with scorn, when he was long before thrown out at the casting forth of the infants, him in the end, when they saw what came to pass, they admired.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "12")
	{


		if ($3 == "12")
		{
			$5 = correctAllVerses($5, "For who shall say, What hast thou done? or who shall withstand thy judgment? or who shall accuse thee for the nations that perish, whom thou made? or who shall come to stand against thee, to be revenged for the unrighteous men?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "27")
		{
			$5 = correctAllVerses($5, "For, look, for what things they grudged, when they were punished, that is, for them whom they thought to be gods; now being punished in them, when they saw it, they acknowledged him to be the true God, whom before they denied to know: and therefore came extreme damnation upon them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "13")
	{


		if ($3 == "10")
		{
			$5 = correctAllVerses($5, "But miserable are they, and in dead things is their hope, who call them gods, which are the works of men’s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "18")
		{
			$5 = correctAllVerses($5, "For health he calleth upon that which is weak: for life prayeth to that which is dead; for aid humbly beseecheth that which hath least means to help: and for a good journey he asketh of that which cannot set a foot forward: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "15")
	{


		if ($3 == "8")
		{
			$5 = correctAllVerses($5, "And employing his labours lewdly, he maketh a vain god of the same clay, even he which a little before was made of earth himself, and within a little while after returneth to the same, out when his life which was lent him shall be demanded.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "16")
	{


		if ($3 == "7")
		{
			$5 = correctAllVerses($5, "For he that turned himself toward it was not saved by the thing that he saw, but by thee, that art the Saviour of all.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "18")
		{
			$5 = correctAllVerses($5, "For sometime the flame was mitigated, that it might not burn up the beasts that were sent against the ungodly; but themselves might see and perceive that they were persecuted with the judgment of God.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "17")
	{


		if ($3 == "8")
		{
			$5 = correctAllVerses($5, "For they, that promised to drive away terrors and troubles from a sick soul, were sick themselves of fear, worthy to be laughed at.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "For wickedness, condemned by her own witness, is very timorous, and being pressed with conscience, always forecasteth grievous things.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
		else if ($3 == "21")
		{
			$5 = correctAllVerses($5, "Over them only was spread an heavy night, an image of that darkness which should afterward receive them: but yet were they unto themselves more grievous than the darkness.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "18")
	{


		if ($3 == "3")
		{
			$5 = correctAllVerses($5, "Instead whereof thou gavest them a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun to entertain them honourably.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "4")
		{
			$5 = correctAllVerses($5, "For they were worthy to be deprived of light and imprisoned in darkness, who had kept thy sons shut up, by whom the uncorrupt light of the law was to be given unto the world.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
		else if ($3 == "15")
		{
			$5 = correctAllVerses($5, "Thine Almighty word leaped down from heaven out of thy royal throne, as a fierce man of war into the midst of a land of destruction, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "So he overcame the destroyer, not with strength of body, nor force of arms, but with a word subdued him that punished, alleging the oaths and covenants made with the fathers.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7

		}
	}
	else if ($2 == "19")
	{


		if ($3 == "14")
		{
			$5 = correctAllVerses($5, "For the Sodomites did not receive those, whom they knew not when they came: but these brought friends into bondage, that had well deserved of them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}

}

/^Prayer of/ {
	if ($2 == "0")
	{


		if ($3 == "7")
		{
			$5 = correctAllVerses($5, "for thou art the most high Lord, of great compassion, longsuffering, very merciful, and repentest of the evils of men. Thou, O Lord, according to thy great goodness hast promised repentance and forgiveness to them that have sinned against thee: and of thine infinite mercies hast appointed repentance unto sinners, that they may be saved.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
}


/^Judith/ {
	if ($2 == "1")
	{


		if ($3 == "6")
		{
			$5 = correctAllVerses($5, "And there came unto him all they that dwelt in the hill country, and all that dwelt by Euphrates, and Tigris and Hydaspes, and the plain of Arioch the king of the Elymeans, and very many nations of the sons of Chelod, assembled themselves to the battle.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "8")
		{
			$5 = correctAllVerses($5, "And to those among the nations that were of Carmel, and Galaad, and the higher Galilee, and the great plain of Esdrelom, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "9")
		{
			$5 = correctAllVerses($5, "And to all that were in Samaria and the cities thereof, and beyond Jordan unto Jerusalem, and Betane, and Chelus, and Kades, and the river of Egypt, and Taphnes, and Ramesse, and all the land of Gesem, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "Until ye come beyond Tanis and Memphis, and to all the inhabitants of Egypt, until ye come to the borders of Ethiopia.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "12")
		{
			$5 = correctAllVerses($5, "Therefore Nabuchodonosor was very angry with all this country, and sware by his throne and kingdom, that he would surely be avenged upon all those coasts of Cilicia, and Damascus, and Syria, and that he would slay with the sword all the inhabitants of the land of Moab, and the children of Ammon, and all Judea, and all that were in Egypt, till ye come to the borders of the two seas.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "2")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "And in the eighteenth year, the two and twentieth day of the first month, there was talk in the house of Nabuchodonosor king of the Assyrians that he should, as he said, avenge himself on all the earth.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "4")
		{
			$5 = correctAllVerses($5, "And when he had ended his counsel, Nabuchodonosor king of the Assyrians called Holofernes the chief captain of his army, which was next unto him, and said unto him.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "7")
		{
			$5 = correctAllVerses($5, "And thou shalt declare unto that they prepare for me earth and water: for I will go forth in my wrath against them and will cover the whole face of the earth with the feet of mine army, and I will give them for a spoil unto them: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "14")
		{
			$5 = correctAllVerses($5, "Then Holofernes went forth from the presence of his lord, and called all the governors and captains, and the officers of the army of Assur; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "20")
		{
			$5 = correctAllVerses($5, "A great number also sundry countries came with them like locusts, and like the sand of the earth: for the multitude was without number.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "And destroyed Phud and Lud, and spoiled all the children of Rasses, and the children of Israel, which were toward the wilderness at the south of the land of the Chellians.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "4")
	{


		if ($3 == "4")
		{
			$5 = correctAllVerses($5, "Therefore they sent into all the coasts of Samaria, and the villages and to Bethoron, and Belmen, and Jericho, and to Choba, and Esora, and to the valley of Salem: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "6")
		{
			$5 = correctAllVerses($5, "Also Joacim the high priest, which was in those days in Jerusalem, wrote to them that dwelt in Bethulia, and Betomestham, which is over against Esdraelon toward the open country, near to Dothaim, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "7")
		{
			$5 = correctAllVerses($5, "Charging them to keep the passages of the hill country: for by them there was an entrance into Judea, and it was easy to stop them that would come up, because the passage was straight, for two men at the most.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "Both they, and their wives and their children, and their cattle, and every stranger and hireling, and their servants bought with money, put sackcloth upon their loins.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "Thus every man and women, and the little children, and the inhabitants of Jerusalem, fell before the temple, and cast ashes upon their heads, and spread out their sackcloth before the face of the Lord: also they put sackcloth about the altar, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "5")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Then was it declared to Holofernes, the chief captain of the army of Assur, that the children of Israel had prepared for war, and had shut up the passages of the hill country, and had fortified all the tops of the high hills and had laid impediments in the champaign countries: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "9")
		{
			$5 = correctAllVerses($5, "Then their God commanded them to depart from the place where they sojourned, and to go into the land of Chanaan: where they dwelt, and were increased with gold and silver, and with very much cattle.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "But when a famine covered all the land of Chanaan, they went down into Egypt, and sojourned there, while they were nourished, and became there a great multitude, so that one could not number their nation.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "16")
		{
			$5 = correctAllVerses($5, "And they cast forth before them the Chanaanite, the Pherezite, the Jebusite, and the Sychemite, and all the Gergesites, and they dwelt in that country many days.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "20")
		{
			$5 = correctAllVerses($5, "Now therefore, my lord and governor, if there be any error against this people, and they sin against their God, let us consider that this shall be their ruin, and let us go up, and we shall overcome them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "And when Achior had finished these sayings, all the people standing round about the tent murmured, and the chief men of Holofernes, and all that dwelt by the sea side, and in Moab, spake that he should kill him.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "For, say they, we will not be afraid of the face of the children of Israel: for, lo, it is a people that have no strength nor power for a strong battle.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "24")
		{
			$5 = correctAllVerses($5, "Now therefore, lord Holofernes, we will go up, and they shall be a prey to be devoured of all thine army.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "6")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "And when the tumult of men that were about the council was ceased, Holofernes the chief captain of the army of Assur said unto Achior and all the Moabites before all the company of other nations, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "2")
		{
			$5 = correctAllVerses($5, "And who art thou, Achior, and the hirelings of Ephraim, that thou hast prophesied against us as to day, and hast said, that we should not make war with the people of Israel, because their God will defend them? and who is God but Nabuchodonosor?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "And thou, Achior, an hireling of Ammon, which hast spoken these words in the day of thine iniquity, shalt see my face no more from this day, until I take vengeance of this nation that came out of Egypt.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "9")
		{
			$5 = correctAllVerses($5, "And if thou persuade thyself in thy mind that they shall be taken, let not thy countenance fall: I have spoken it, and none of my words shall be in vain.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "Then Holofernes commanded his servants, that waited in his tent, to take Achior, and bring him to Bethulia, and deliver him into the hands of the children of Israel.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "7")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "The next day Holofernes commanded all his army, and all his people which were come to take his part, that they should remove their camp against Bethulia, to take aforehand the ascents of the hill country, and to make war against the children of Israel.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "3")
		{
			$5 = correctAllVerses($5, "And they camped in the valley near unto Bethulia, by the fountain, and they spread themselves in breadth over Dothaim even to Belmaim, and in length from Bethulia unto Cynamon, which is over against Esdraelon.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "4")
		{
			$5 = correctAllVerses($5, "Now the children of Israel, when they saw the multitude of them, were greatly troubled, and said every one to his neighbour, Now will these men lick up the face of the earth; for neither the high mountains, nor the valleys, nor the hills, are able to bear their weight.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "18")
		{
			$5 = correctAllVerses($5, "Then the children of Esau went up with the children of Ammon, and camped in the hill country over against Dothaim: and they sent some of them toward the south, and toward the east over against Ekrebel, which is near unto Chusi, that is upon the brook Mochmur; and the rest of the army of the Assyrians camped in the plain, and covered the face of the whole land; and their tents and carriages were pitched to a very great multitude.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "8")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Now at that time Judith heard thereof, which was the daughter of Merari, the son of Ox, the son of Joseph, the son of Ozel, the son of Elcia, the son of Ananias, the son of Gedeon, the son of Raphaim, the son of Acitho, the son of Eliu, the son of Eliab, the son of Nathanael, the son of Samael, the son of Salasadal, the son of Israel.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "And she made her a tent upon the top of her house, and put on sackcloth upon her loins and ware her widow’s apparel.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "6")
		{
			$5 = correctAllVerses($5, "And she fasted all the days of her widowhood, save the eves of the sabbaths, and the sabbaths, and the eves of the new moons, and the new moons and the feasts and solemn days of the house of Israel.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "7")
		{
			$5 = correctAllVerses($5, "She was also of a goodly countenance, and very beautiful to behold: and her husband Manasses had left her gold, and silver, and menservants and maidservants, and cattle, and lands; and she remained upon them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "9")
		{
			$5 = correctAllVerses($5, "Now when she heard the evil words of the people against the governor, that they fainted for lack of water; for Judith had heard all the words that Ozias had spoken unto them, and that he had sworn to deliver the city unto the Assyrians after five days; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "Then she sent her waitingwoman, that had the government of all things that she had, to call Ozias and Chabris and Charmis, the ancients of the city.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "12")
		{
			$5 = correctAllVerses($5, "And now who are ye that have tempted God this day, and stand instead of God among the children of men?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "14")
		{
			$5 = correctAllVerses($5, "For ye cannot find the depth of the heart of man, neither can ye perceive the things that he thinketh: then how can ye search out God, that hath made all these things, and know his mind, or comprehend his purpose? Nay, my brethren, provoke not the Lord our God to anger.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "18")
		{
			$5 = correctAllVerses($5, "For there arose none in our age, neither is there any now in these days neither tribe, nor family, nor people, nor city among us, which worship gods made with hands, as hath been aforetime.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "33")
		{
			$5 = correctAllVerses($5, "Ye shall stand this night in the gate, and I will go forth with my waitingwoman: and within the days that ye have promised to deliver the city to our enemies the Lord will visit Israel by mine hand.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "9")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Judith fell upon her face, and put ashes upon her head, and uncovered the sackcloth wherewith she was clothed; and about the time that the incense of that evening was offered in Jerusalem in the house of the Lord Judith cried with a loud voice, and said, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "4")
		{
			$5 = correctAllVerses($5, "And hast given their wives for a prey, and their daughters to be captives, and all their spoils to be divided among thy dear children; which were moved with thy zeal, and abhorred the pollution of their blood, and called upon thee for aid: O God, O my God, hear me also a widow.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "7")
		{
			$5 = correctAllVerses($5, "For, behold, the Assyrians are multiplied in their power; they are exalted with horse and man; they glory in the strength of their footmen; they trust in shield, and spear, and bow, and sling; and know not that thou art the Lord that breakest the battles: the Lord is thy name.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "8")
		{
			$5 = correctAllVerses($5, "Throw down their strength in thy power, and bring down their force in thy wrath: for they have purposed to defile thy sanctuary, and to pollute the tabernacle where thy glorious name resteth and to cast down with sword the horn of thy altar.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "For thy power standeth not in multitude nor thy might in strong men: for thou art a God of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "10")
	{


		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "She rose where she had fallen down, and called her maid, and went down into the house in the which she abode in the sabbath days, and in her feast days, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}	
		else if ($3 == "6")
		{
			$5 = correctAllVerses($5, "Thus they went forth to the gate of the city of Bethulia, and found standing there Ozias and the ancients of the city, Chabris and Charmis.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "8")
		{
			$5 = correctAllVerses($5, "The God, the God of our fathers give thee favour, and accomplish thine enterprizes to the glory of the children of Israel, and to the exaltation of Jerusalem. Then they worshipped God.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "21")
		{
			$5 = correctAllVerses($5, "Now Holofernes rested upon his bed under a canopy, which was woven with purple, and gold, and emeralds, and precious stones.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "And when Judith was come before him and his servants they all marvelled at the beauty of her countenance; and she fell down upon her face, and did reverence unto him: and his servants took her up.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "11")
	{


		if ($3 == "10")
		{
			$5 = correctAllVerses($5, "Therefore, O lord and governor, respect not his word; but lay it up in thine heart, for it is true: for our nation shall not be punished, neither can sword prevail against them, except they sin against their God.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "13")
		{
			$5 = correctAllVerses($5, "And are resolved to spend the firstfruits of the tenths of wine and oil, which they had sanctified, and reserved for the priests that serve in Jerusalem before the face of our God; the which things it is not lawful for any of the people so much as to touch with their hands.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "Likewise Holofernes said unto her. God hath done well to send thee before the people, that strength might be in our hands and destruction upon them that lightly regard my lord.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "And now thou art both beautiful in thy countenance, and witty in thy words: surely if thou do as thou hast spoken thy God shall be my God, and thou shalt dwell in the house of king Nabuchodonosor, and shalt be renowned through the whole earth.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "12")
	{


		if ($3 == "4")
		{
			$5 = correctAllVerses($5, "Then said Judith unto him As thy soul liveth, my lord, thine handmaid shall not spend those things that I have, before the Lord work by mine hand the things that he hath determined.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "Then the servants of Holofernes brought her into the tent, and she slept till midnight, and she arose when it was toward the morning watch, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "7")
		{
			$5 = correctAllVerses($5, "Then Holofernes commanded his guard that they should not stay her: thus she abode in the camp three days, and went out in the night into the valley of Bethulia, and washed herself in a fountain of water by the camp.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "And in the fourth day Holofernes made a feast to his own servants only, and called none of the officers to the banquet.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "13")
		{
			$5 = correctAllVerses($5, "Then went Bagoas from the presence of Holofernes, and came to her, and he said, Let not this fair damsel fear to come to my lord, and to be honoured in his presence, and drink wine, and be merry with us and be made this day as one of the daughters of the Assyrians, which serve in the house of Nabuchodonosor.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "16")
		{
			$5 = correctAllVerses($5, "Now when Judith came in and sat down, Holofernes his heart was ravished with her, and his mind was moved, and he desired greatly her company; for he waited a time to deceive her, from the day that he had seen her.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "13")
	{


		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "And Judith was left alone in the tent, and Holofernes lying along upon his bed: for he was filled with wine.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "4")
		{
			$5 = correctAllVerses($5, "So all went forth and none was left in the bedchamber, neither little nor great. Then Judith, standing by his bed, said in her heart, O Lord God of all power, look at this present upon the works of mine hands for the exaltation of Jerusalem.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "For now is the time to help thine inheritance, and to execute thine enterprizes to the destruction of the enemies which are risen against us.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "6")
		{
			$5 = correctAllVerses($5, "Then she came to the pillar of the bed, which was at Holofernes’ head, and took down his fauchion from thence, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "15")
		{
			$5 = correctAllVerses($5, "So she took the head out of the bag, and shewed it, and said unto them, behold the head of Holofernes, the chief captain of the army of Assur, and behold the canopy, wherein he did lie in his drunkenness; and the Lord hath smitten him by the hand of a woman.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "20")
		{
			$5 = correctAllVerses($5, "And God turn these things to thee for a perpetual praise, to visit thee in good things because thou hast not spared thy life for the affliction of our nation, but hast revenged our ruin, walking a straight way before our God. And all the people said; So be it, so be it.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "14")
	{


		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "And so soon as the morning shall appear, and the sun shall come forth upon the earth, take ye every one his weapons, and go forth every valiant man out of the city, and set ye a captain over them, as though ye would go down into the field toward the watch of the Assyrians; but go not down.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "But before ye do these things, call me Achior the Ammonite, that he may see and know him that despised the house of Israel, and that sent him to us as it were to his death.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "6")
		{
			$5 = correctAllVerses($5, "Then they called Achior out of the house of Ozias; and when he was come, and saw the head of Holofernes in a man’s hand in the assembly of the people, he fell down on his face, and his spirit failed.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "And as soon as the morning arose, they hanged the head of Holofernes upon the wall, and every man took his weapons, and they went forth by bands unto the straits of the mountain.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "13")
		{
			$5 = correctAllVerses($5, "So they came to Holofernes’ tent, and said to him that had the charge of all his things, Waken now our lord: for the slaves have been bold to come down against us to battle, that they may be utterly destroyed.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "17")
		{
			$5 = correctAllVerses($5, "After he went into the tent where Judith lodged: and when he found her not, he leaped out to the people, and cried, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "19")
		{
			$5 = correctAllVerses($5, "When the captains of the Assyrians’ army heard these words, they rent their coats and their minds were wonderfully troubled, and there was a cry and a very great noise throughout the camp.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "15")
	{


		if ($3 == "5")
		{
			$5 = correctAllVerses($5, "Now when the children of Israel heard it, they all fell upon them with one consent, and slew them unto Chobai: likewise also they that came from Jerusalem, and from all the hill country, (for men had told them what things were done in the camp of their enemies) and they that were in Galaad, and in Galilee, chased them with a great slaughter, until they were past Damascus and the borders thereof.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "And the people spoiled the camp the space of thirty days: and they gave unto Judith Holofernes his tent, and all his plate, and beds, and vessels, and all his stuff: and she took it and laid it on her mule; and made ready her carts, and laid them thereon.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "16")
	{


		if ($3 == "12")
		{
			$5 = correctAllVerses($5, "The sons of the damsels have pierced them through, and wounded them as fugatives’ children: they perished by the battle of the Lord.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "19")
		{
			$5 = correctAllVerses($5, "Judith also dedicated all the stuff of Holofernes, which the people had given her, and gave the canopy, which she had taken out of his bedchamber, for a gift unto the Lord.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}


}

/^Esther/ {
	if ($2 == "11")
	{


		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "In the second year of the reign of Artexerxes the great, in the first day of the month Nisan, Mardocheus the son of Jairus, the son of Semei, the son of Cisai, of the tribe of Benjamin, had a dream; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "8")
		{
			$5 = correctAllVerses($5, "And lo a day of darkness and obscurity, tribulation and anguish, affliction and great uproar, upon earth.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "13")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "The copy of the letters was this: The great king Artexerxes writeth these things to the princes and governours that are under him from India unto Ethiopia in an hundred and seven and twenty provinces.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "2")
		{
			$5 = correctAllVerses($5, "After that I became lord over many nations and had dominion over the whole world, not lifted up with presumption of my authority, but carrying myself always with equity and mildness, I purposed to settle my subjects continually in a quiet life, and making my kingdom peaceable, and open for passage to the utmost coasts, to renew peace, which is desired of all men.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "3")
		{
			$5 = correctAllVerses($5, "Now when I asked my counsellors how this might be brought to pass, Aman, that excelled in wisdom among us, and was approved for his constant good will and steadfast fidelity, and had the honour of the second place in the kingdom, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "4")
		{
			$5 = correctAllVerses($5, "Declared unto us, that in all nations throughout the world there was scattered a certain malicious people, that had laws contrary to all nations, and continually despised the commandments of kings, so as the uniting of our kingdoms, honourably intended by us cannot go forward.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "14")
	{


		if ($3 == "5")
		{
			$5 = correctAllVerses($5, "From my youth up I have heard in the tribe of my family that thou, O Lord, tookest Israel from among all people, and our fathers from all their predecessors, for a perpetual inheritance, and thou hast performed whatsoever thou didst promise them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "19")
		{
			$5 = correctAllVerses($5, "O thou mighty God above all, hear the voice of the forlorn and deliver us out of the hands of the mischievous, and deliver me out of my fear.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "15")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "And upon the third day, when she had ended her prayers, she laid away her mourning garments, and put on her glorious apparel.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "16")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "The great king Artexerxes unto the princes and governors of an hundred and seven and twenty provinces from India unto Ethiopia, and unto all our faithful subjects, greeting.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "11")
		{
			$5 = correctAllVerses($5, "Had so far forth obtained the favour that we shew toward every nation, as that he was called our father, and was continually honoured of all the next person unto the king.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "16")
		{
			$5 = correctAllVerses($5, "And that they be children of the most high and most mighty, living God, who hath ordered the kingdom both unto us and to our progenitors in the most excellent manner.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "18")
		{
			$5 = correctAllVerses($5, "For he that was the worker of these things, is hanged at the gates of Susa with all his family: God, who ruleth all things, speedily rendering vengeance to him according to his deserts.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
}

/^1 Mac/ {
	if ($2 == "1")
	{


		if ($3 == "4")
		{
			$5 = correctAllVerses($5, "And he gathered a mighty strong host and ruled over countries, and nations, and kings, who became tributaries unto him.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "And there came out of them a wicked root Antiochus surnamed Epiphanes, son of Antiochus the king, who had been an hostage at Rome, and he reigned in the hundred and thirty and seventh year of the kingdom of the Greeks.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "17")
		{
			$5 = correctAllVerses($5, "Wherefore he entered into Egypt with a great multitude, with chariots, and elephants, and horsemen, and a great navy, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "And the table of the shewbread, and the pouring vessels, and the vials. and the censers of gold, and the veil, and the crown, and the golden ornaments that were before the temple, all which he pulled off.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "44")
		{
			$5 = correctAllVerses($5, "For the king had sent letters by messengers unto Jerusalem and the cities of Juda that they should follow the strange laws of the land, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "57")
		{
			$5 = correctAllVerses($5, "And whosoever was found with any the book of the testament, or if any committed to the law, the king’s commandment was, that they should put him to death.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "60")
		{
			$5 = correctAllVerses($5, "At which time according to the commandment they put to death certain women, that had caused their children to be circumcised.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "2")
	{


		if ($3 == "7")
		{
			$5 = correctAllVerses($5, "He said, Woe is me! wherefore was I born to see this misery of my people, and of the holy city, and to dwell there, when it was delivered into the hand of the enemy, and the sanctuary into the hand of strangers?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "12")
		{
			$5 = correctAllVerses($5, "And, behold, our sanctuary, even our beauty and our glory, is laid waste, and the Gentiles have profaned it.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "18")
		{
			$5 = correctAllVerses($5, "Now therefore come thou first, and fulfil the king’s commandment, like as all the heathen have done, yea, and the men of Juda also, and such as remain at Jerusalem: so shalt thou and thy house be in the number of the king’s friends, and thou and thy children shall be honoured with silver and gold, and many rewards.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "64")
		{
			$5 = correctAllVerses($5, "Wherefore, ye my sons, be valiant and shew yourselves men in the behalf of the law; for by it shall ye obtain glory.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "3")
	{


		if ($3 == "16")
		{
			$5 = correctAllVerses($5, "And when he came near to the going up of Bethhoron, Judas went forth to meet him with a small company: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "38")
		{
			$5 = correctAllVerses($5, "Then Lysias chose Ptolemee the son of Dorymenes, Nicanor, and Gorgias, mighty men of the king’s friends: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "4")
	{


		if ($3 == "30")
		{
			$5 = correctAllVerses($5, "And when he saw that mighty army, he prayed and said, Blessed art thou, O Saviour of Israel, who didst quell the violence of the mighty man by the hand of thy servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "38")
		{
			$5 = correctAllVerses($5, "And when they saw the sanctuary desolate, and the altar profaned, and the gates burned up, and shrubs growing in the courts as in a forest, or in one of the mountains, yea, and the priests’ chambers pulled down; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "50")
		{
			$5 = correctAllVerses($5, "And upon the altar they burned incense, and the lamps that were upon the candlestick they lighted, that they might give light in the temple.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "57")
		{
			$5 = correctAllVerses($5, "They decked also the forefront of the temple with crowns of gold, and with shields; and the gates and the chambers they renewed, and hanged doors upon them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}


	}
	else if ($2 == "5")
	{


		if ($3 == "25")
		{
			$5 = correctAllVerses($5, "Where they met with the Nabathites, who came unto them in a peaceable manner, and told them every thing that had happened to their brethren in the land of Galaad: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "26")
		{
			$5 = correctAllVerses($5, "And how that many of them were shut up in Bosora, and Bosor, and Alema, Casphor, Maked, and Carnaim; all these cities are strong and great: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "28")
		{
			$5 = correctAllVerses($5, "Hereupon Judas and his host turned suddenly by the way of the wilderness unto Bosora; and when he had won the city, he slew all the males with the edge of the sword, and took all their spoils, and burned the city with fire, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "This done, Judas turned aside to Maspha; and after he had assaulted it he took and slew all the males therein, and received the spoils thereof and and burnt it with fire.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "44")
		{
			$5 = correctAllVerses($5, "But they took the city, and burned the temple with all that were therein. Thus was Carnaim subdued, neither could they stand any longer before Judas.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "58")
		{
			$5 = correctAllVerses($5, "So when they had given charge unto the garrison that was with them, they went toward Jamnia.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}




	}
	else if ($2 == "6")
	{


		if ($3 == "17")
		{
			$5 = correctAllVerses($5, "Now when Lysias knew that the king was dead, he set up Antiochus his son, whom he had brought up being young, to reign in his stead, and his name he called Eupator.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "49")
		{
			$5 = correctAllVerses($5, "But with them that were in Bethsura he made peace: for they came out of the city, because they had no victuals there to endure the siege, it being a year of rest to the land.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "62")
		{
			$5 = correctAllVerses($5, "Then the king entered into mount Sion; but when he saw the strength of the place, he broke his oath that he had made, and gave commandment to pull down the wall round about.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "7")
	{


		if ($3 == "31")
		{
			$5 = correctAllVerses($5, "Nicanor also, when he saw that his counsel was discovered, went out to fight against Judas beside Capharsalama: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "And sware in his wrath, saying, Unless Judas and his host be now delivered into my hands, if ever I come again in safety, I will burn up this house: and with that he went out in a great rage.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "47")
		{
			$5 = correctAllVerses($5, "Afterwards they took the spoils, and the prey, and smote off Nicanors head, and his right hand, which he stretched out so proudly, and brought them away, and hanged them up toward Jerusalem.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "8")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Now Judas had heard of the Romans, that they were mighty and valiant men, and such as would lovingly accept all that joined themselves unto them, and make a league of amity with all that came unto them; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "2")
		{
			$5 = correctAllVerses($5, "And that they were men of great valour. It was told him also of their wars and noble acts which they had done among the Galatians, and how they had conquered them, and brought them under tribute; ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "Beside this, how they had discomfited in battle Philip, and Perseus, king of the Citims, with others that lifted up themselves against them, and had overcome them: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "31")
		{
			$5 = correctAllVerses($5, "And as touching the evils that Demetrius doeth to the Jews, we have written unto him, saying, Wherefore thou made thy yoke heavy upon our friends and confederates the Jews?")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "9")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Furthermore, when Demetrius heard the Nicanor and his host were slain in battle, he sent Bacchides and Alcimus into the land of Judea the second time, and with them the chief strength of his host: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "Now after the death of Judas the wicked began to put forth their heads in all the coasts of Israel, and there arose up all such as wrought iniquity.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "26")
		{
			$5 = correctAllVerses($5, "And they made enquiry and search for Judas’ friends, and brought them unto Bacchides, who took vengeance of them, and used them despitefully.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "Now Jonathan had sent his brother John, a captain of the people, to pray his friends the Nabathites, that they might leave with them their carriage, which was much.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "39")
		{
			$5 = correctAllVerses($5, "Where they lifted up their eyes, and looked, and, behold, there was much ado and great carriage: and the bridegroom came forth, and his friends and brethren, to meet them with drums, and instruments of musick, and many weapons.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "50")
		{
			$5 = correctAllVerses($5, "Afterward returned Bacchides to Jerusalem and repaired the strong cites in Judea; the fort in Jericho, and Emmaus, and Bethhoron, and Bethel, and Thamnatha, Pharathoni, and Taphon, these did he strengthen with high walls, with gates and with bars.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "52")
		{
			$5 = correctAllVerses($5, "He fortified also the city Bethsura, and Gazera, and the tower, and put forces in them, and provision of victuals.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "55")
		{
			$5 = correctAllVerses($5, "And as he began to pull down, even at that time was Alcimus plagued, and his enterprizes hindered: for his mouth was stopped, and he was taken with a palsy, so that he could no more speak any thing, nor give order concerning his house.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "67")
		{
			$5 = correctAllVerses($5, "And when he began to smite them, and came up with his forces, Simon and his company went out of the city, and burned up the engines of war, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "10")
	{

		if ($3 == "6")
		{
			$5 = correctAllVerses($5, "Wherefore he gave him authority to gather together an host, and to provide weapons, that he might aid him in battle: he commanded also that the hostages that were in the tower should be delivered him.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "29")
		{
			$5 = correctAllVerses($5, "And now do I free you, and for your sake I release all the Jews, from tributes, and from the customs of salt, and from crown taxes, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "30")
		{
			$5 = correctAllVerses($5, "And from that which appertaineth unto me to receive for the third part or the seed, and the half of the fruit of the trees, I release it from this day forth, so that they shall not be taken of the land of Judea, nor of the three governments which are added thereunto out of the country of Samaria and Galilee, from this day forth for evermore.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "32")
		{
			$5 = correctAllVerses($5, "And as for the tower which is at Jerusalem, I yield up authority over it, and give the high priest, that he may set in it such men as he shall choose to keep it.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "34")
		{
			$5 = correctAllVerses($5, "Furthermore I will that all the feasts, and sabbaths, and new moons, and solemn days, and the three days before the feast, and the three days after the feast shall be all of immunity and freedom for all the Jews in my realm.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "Also no man shall have authority to meddle with or to molest any of them in any matter.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "42")
		{
			$5 = correctAllVerses($5, "And beside this, the five thousand shekels of silver, which they took from the uses of the temple out of the accounts year by year, even those things shall be released, because they appertain to the priests that minister.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "63")
		{
			$5 = correctAllVerses($5, "And he made him sit by himself, and said unto his princes, Go with him into the midst of the city, and make proclamation, that no man complain against him of any matter, and that no man trouble him for any manner of cause.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "65")
		{
			$5 = correctAllVerses($5, "So the king honoured him, and wrote him among his chief friends, and made him a duke, and partaker of his dominion.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "69")
		{
			$5 = correctAllVerses($5, "Then Demetrius made Apollonius the governor of Celosyria his general, who gathered together a great host, and camped in Jamnia, and sent unto Jonathan the high priest, saying, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "83")
		{
			$5 = correctAllVerses($5, "The horsemen also, being scattered in the field, fled to Azotus, and went into Bethdagon, their idol’s temple, for safety.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "89")
		{
			$5 = correctAllVerses($5, "And sent him a buckle of gold, as the use is to be given to such as are of the king’s blood: he gave him also Accaron with the borders thereof in possession.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "11")
	{

		if ($3 == "2")
		{
			$5 = correctAllVerses($5, "Whereupon he took his journey into Spain in peaceable manner, so as they of the cities opened unto him, and met him: for king Alexander had commanded them so to do, because he was his brother in law.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "9")
		{
			$5 = correctAllVerses($5, "Whereupon he sent ambasadors unto king Demetrius, saying, Come, let us make a league betwixt us, and I will give thee my daughter whom Alexander hath, and thou shalt reign in thy father’s kingdom: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "21")
		{
			$5 = correctAllVerses($5, "Then came ungodly persons, who hated their own people, went unto the king, and told him that Jonathan besieged the tower, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "27")
		{
			$5 = correctAllVerses($5, "And confirmed him in the high priesthood, and in all the honours that he had before, and gave him preeminence among his chief friends.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "And as for other things that belong unto us, of the tithes and customs pertaining unto us, as also the saltpits, and the crown taxes, which are due unto us, we discharge them of them all for their relief.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}




	}
	else if ($2 == "12")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Now when Jonathan saw that time served him, he chose certain men, and sent them to Rome, for to confirm and renew the friendship that they had with them.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "7")
		{
			$5 = correctAllVerses($5, "There were letters sent in times past unto Onias the high priest from Darius, who reigned then among you, to signify that ye are our brethren, as the copy here underwritten doth specify.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "9")
		{
			$5 = correctAllVerses($5, "Therefore we also, albeit we need none of these things, that we have the holy books of scripture in our hands to comfort us, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "Now therefore, since this is come to our knowledge, ye shall do well to write unto us of your prosperity.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "24")
		{
			$5 = correctAllVerses($5, "Now when Jonathan heard that Demebius’ princes were come to fight against him with a greater host than afore, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "49")
		{
			$5 = correctAllVerses($5, "Then sent Tryphon an host of footmen and horsemen into Galilee, and into the great plain, to destroy all Jonathan’s company.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "53")
		{
			$5 = correctAllVerses($5, "Then all the heathen that were round about then sought to destroy them: for said they, They have no captain, nor any to help them: now therefore let us make war upon them, and take away their memorial from among men.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "13")
	{


		if ($3 == "11")
		{
			$5 = correctAllVerses($5, "Also he sent Jonathan the son of Absolom, and with him a great power, to Joppa: who casting out them that were therein remained there in it.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "12")
		{
			$5 = correctAllVerses($5, "So Tryphon removed from Ptolemaus with a great power to invade the land of Judea, and Jonathan was with him in ward.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "47")
		{
			$5 = correctAllVerses($5, "So Simon was appeased toward them, and fought no more against them, but put them out of the city, and cleansed the houses wherein the idols were, and so entered into it with songs and thanksgiving.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "51")
		{
			$5 = correctAllVerses($5, "And entered into it the three and twentieth day of the second month in the hundred seventy and first year, with thanksgiving, and branches of palm trees, and with harps, and cymbals, and with viols, and hymns, and songs: because there was destroyed a great enemy out of Israel.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "53")
		{
			$5 = correctAllVerses($5, "And when Simon saw that John his son was a valiant man, he made him captain of all the hosts; and he dwelt in Gazera.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "14")
	{


		if ($3 == "5")
		{
			$5 = correctAllVerses($5, "And as he was honourable in all his acts, so in this, that he took Joppa for an haven, and made an entrance to the isles of the sea, ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "7")
		{
			$5 = correctAllVerses($5, "And gathered together a great number of captives, and had the dominion of Gazera, and Bethsura, and the tower, out of the which he took all uncleaness, neither was there any that resisted him.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "29")
		{
			$5 = correctAllVerses($5, "Forasmuch as oftentimes there have been wars in the country, wherein for the maintenance of their sanctuary, and the law, Simon the son of Mattathias, of the posterity of Jarib, together with his brethren, put themselves in jeopardy, and resisting the enemies of their nation did their nation great honour: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "34")
		{
			$5 = correctAllVerses($5, "Moreover he fortified Joppa, which lieth upon the sea, and Gazera, that bordereth upon Azotus, where the enemies had dwelt before: but he placed Jews there, and furnished them with all things convenient for the reparation thereof.)")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "The people therefore sang the acts of Simon, and unto what glory he thought to bring his nation, made him their governor and chief priest, because he had done all these things, and for the justice and faith which he kept to his nation, and for that he sought by all means to exalt his people.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "43")
		{
			$5 = correctAllVerses($5, "Beside this, that he should be obeyed of every man, and that all the writings in the country should be made in his name, and that he should be clothed in purple, and wear gold: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "15")
	{


		if ($3 == "8")
		{
			$5 = correctAllVerses($5, "And if anything be, or shall be, owing to the king, let it be forgiven thee from this time forth for evermore.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "And to all the countries and to Sampsames, and the Lacedemonians, and to Delus, and Myndus, and Sicyon, and Caria, and Samos, and Pamphylia, and Lycia, and Halicarnassus, and Rhodus, and Aradus, and Cos, and Side, and Aradus, and Gortyna, and Cnidus, and Cyprus, and Cyrene.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "28")
		{
			$5 = correctAllVerses($5, "Furthermore he sent unto him Athenobius, one of his friends, to commune with him, and say, Ye withhold Joppa and Gazera; with the tower that is in Jerusalem, which are cities of my realm.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "31")
		{
			$5 = correctAllVerses($5, "Or else give me for them five hundred talents of silver; and for the harm that ye have done, and the tributes of the cities, other five hundred talents: if not, we will come and fight against you ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "35")
		{
			$5 = correctAllVerses($5, "And whereas thou demandest Joppa and Gazera, albeit they did great harm unto the people in our country, yet will we give thee an hundred talents for them. Hereunto Athenobius answered him not a word;")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "16")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "Then came up John from Gazera, and told Simon his father what Cendebeus had done.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "2")
		{
			$5 = correctAllVerses($5, "Wherefore Simon called his two eldest sons, Judas and John, and said unto them, I, and my brethren, and my father’s house, have ever from my youth unto this day fought against the enemies of Israel; and things have prospered so well in our hands, that we have delivered Israel oftentimes.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "19")
		{
			$5 = correctAllVerses($5, "He sent others also to Gazera to kill John: and unto the tribunes he sent letters to come unto him, that he might give them silver, and gold, and rewards.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "21")
		{
			$5 = correctAllVerses($5, "Now one had run afore to Gazera and told John that his father and brethren were slain, and, quoth he, Ptolemee hath sent to slay thee also.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
}

/^2 Mac/ {
	if ($2 == "1")
	{


		if ($3 == "8")
		{
			$5 = correctAllVerses($5, "And burned the porch, and shed innocent blood: then we prayed unto the Lord, and were heard; we offered also sacrifices and fine flour, and lighted the lamps, and set forth the loaves.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "In the hundred fourscore and eighth year, the people that were at Jerusalem and in Judea, and the council, and Judas, sent greeting and health unto Aristobulus, king Ptolemeus’ master, who was of the stock of the anointed priests, and to the Jews that were in Egypt: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}

	}
	else if ($2 == "2")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "It is also found in the records, that Jeremy the prophet commanded them that were carried away to take of the fire, as it hath been signified: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "5")
		{
			$5 = correctAllVerses($5, "And when Jeremy came thither, he found an hollow cave, wherein he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "3")
	{


		if ($3 == "3")
		{
			$5 = correctAllVerses($5, "Insomuch that Seleucus of Asia of his own revenues bare all the costs belonging to the service of the sacrifices.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "8")
		{
			$5 = correctAllVerses($5, "So forthwith Heliodorus took his journey; under a colour of visiting the cities of Celosyria and Phenice, but indeed to fulfil the king’s purpose.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "12")
		{
			$5 = correctAllVerses($5, "And that it was altogether impossible that such wrongs should be done unto them, that had committed it to the holiness of the place, and to the majesty and inviolable sanctity of the temple, honoured over all the world.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "25")
		{
			$5 = correctAllVerses($5, "For there appeared unto them an horse with a terrible rider upon him, and adorned with a very fair covering, and he ran fiercely, and smote at Heliodorus with his forefeet, and it seemed that he that sat upon the horse had complete harness of gold.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
	else if ($2 == "4")
	{


		if ($3 == "1")
		{
			$5 = correctAllVerses($5, "This Simon now, of whom we spake afore, having been a betrayer of the money, and of his country, slandered Onias, as if he ha terrified Heliodorus, and been the worker of these evils.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "2")
		{
			$5 = correctAllVerses($5, "Thus was he bold to call him a traitor, that had deserved well of the city, and tendered his own nation, and was so zealous of the laws.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "10")
		{
			$5 = correctAllVerses($5, "Which when the king had granted, and he had gotten into his hand the rule he forthwith brought his own nation to Greekish fashion.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "22")
		{
			$5 = correctAllVerses($5, "Where he was honourably received of Jason, and of the city, and was brought in with torch alight, and with great shoutings: and so afterward went with his host unto Phenice.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "23")
		{
			$5 = correctAllVerses($5, "Three years afterward Jason sent Menelaus, the aforesaid Simon’s brother, to bear the money unto the king, and to put him in mind of certain necessary matters.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "27")
		{
			$5 = correctAllVerses($5, "So Menelaus got the principality: but as for the money that he had promised unto the king, he took no good order for it, albeit Sostratis the ruler of the castle required it: ")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "42")
		{
			$5 = correctAllVerses($5, "Thus many of them they wounded, and some they struck to the ground, and all of them they forced to flee: but as for the churchrobber himself, him they killed beside the treasury.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
		else if ($3 == "50")
		{
			$5 = correctAllVerses($5, "And so through the covetousness of them that were of power Menelaus remained still in authority, increasing in malice, and being a great traitor to the citizens.")

				toReturn = $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7
		}
	}
}


{
print toReturn;
}
