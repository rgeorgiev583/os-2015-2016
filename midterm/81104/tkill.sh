#!/bin/bash/
#usage tkill TERM...

if [[ $# -eq 0 ]]
then
	exit 1 #Error: too few arguments
fi
else

for term
do
	for line in $(grep $(ps aux) "$term")
	do
		kill "$(cut -f7 -d' ' $line)"
	done
done