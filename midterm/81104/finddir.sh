#!/bin/bash/
#usage finddir FILE...

function getDir(){
	local filename=$1
	echo "$filename" | rev | cut -d'/' -f2 | rev
}

if [[ $# -eq 0 ]]
then
	input=$(cat)
	while read -r line
	do
		while read -r p
		do
			getDir $p
		done <$line
	done < $input
fi

else
	for filename
	do
		while read -r p
		do
			getDir $p
		done <$filename
	done
fi