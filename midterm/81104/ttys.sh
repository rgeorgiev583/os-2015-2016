#!/bin/bash
#usage ttys USER...

if [[ $# -eq 0 ]]
then
	exit 1 #Error: too few arguments
fi
else

for user
do
	who | grep "$user" | cut -f2 -d$'\t'
done