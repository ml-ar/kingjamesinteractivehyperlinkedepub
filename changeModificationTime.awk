
/<meta property="dcterms:modified">/{

cmd = "date -u +%Y-%m-%dT%H:%M:%SZ"
    while (cmd | getline line) {
        newDate = line; end; 
    }


$0 = gensub(/<meta property="dcterms:modified">.*$/,"<meta property=\"dcterms:modified\">" newDate "</meta>","1")


}

{
print $0
}



