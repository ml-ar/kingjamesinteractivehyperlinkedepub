#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No path to xhtmls passed as the argument."
exit 1
fi

if [ $# -gt 1 ]
then
echo "More than one argument . Did you forget quotes?"
exit 1
fi

if [ ! -d "$1" ]
then
echo "Could not find the directory specified in the argument."
exit 1
fi

for i in "$1"'/'*.xhtml; do
	(gawk -f errantspaceremover.awk "$i" > "$i.output") && sleep 1 && rm "$i" && cp "$i.output" "$i" && rm "$i.output"

done

