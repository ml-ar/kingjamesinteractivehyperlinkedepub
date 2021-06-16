#feed a list of footnotes into this script to correct discrepancies

#Susanna
{

toReturn = $0

#Susanna
toReturn = gensub(/The History of Susanna\.\s*/,"","g", toReturn)
toReturn = gensub(/Then Susanna sighed, and said, I am straited on every side: for if I do this thing,/,"Then Susanna sighed, and said, I am straitened on every side: for if I do this thing,","g", toReturn)
toReturn = gensub(/So when the servants of the house heard the cry in the garden, they rushed in at a/,"So when the servants of the house heard the cry in the garden, they rushed in at the","g",toReturn)
toReturn = gensub(/Then the assembly believed them, as those that were/,"Then the assembly believed them as those that were","g",toReturn)
toReturn = gensub(/So he standing in the midst of them, said, Are ye such fools, ye sons of Israel, that without examination or knowledge of the truth ye have condemned/,"So he standing in the midst of them said, Are ye such fools, ye sons of Israel, that without examination or knowledge of the truth ye have condemned","g",toReturn)
toReturn = gensub(/for thou hast pronounced false judgment, and hast condemned the innocent, and hast let the guilty go free; albeit the Lord saith,/,"For thou hast pronounced false judgment and hast condemned the innocent and hast let the guilty go free; albeit the Lord saith,","g",toReturn)
toReturn = gensub(/So he put him aside, and commanded to bring the other, and said unto him, O thou seed of Canaan, and not of Juda, beauty hath deceived thee, and lust hath/,"So he put him aside, and commanded to bring the other, and said unto him, O thou seed of Chanaan, and not of Juda, beauty hath deceived thee, and lust hath","g",toReturn)
toReturn = gensub(/Now therefore tell me, Under what tree didst thou take them companying together\? Who answered, Under a\s+/,"Now therefore tell me, Under what tree didst thou take them companying together? Who answered, Under an ","g",toReturn)
toReturn = gensub(/And they arose against the two elders, \(for/,"And they arose against the two elders, for","g",toReturn)

print toReturn;
}
