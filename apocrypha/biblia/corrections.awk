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
{
print toReturn;
}
