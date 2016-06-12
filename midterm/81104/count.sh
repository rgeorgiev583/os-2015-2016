#!/bin/bash/
#usage count EXT DIR...

if [[ $# -lt 2 ]]
then
	exit 1 #Error: too few arguments
fi
else
i=0
for dir in ${@:2}
do
	for filename in $(find "$dir" -type f)
	do
		if [[ "$filename" == "*.$1" ]]
		then
			i++
		fi
	done
	echo "$i files in $dir"
	i=0
done