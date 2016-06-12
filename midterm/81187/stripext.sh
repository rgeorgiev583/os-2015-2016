#!/bin/bash

#   Comparison of number to zero is not done this way!  Use `[ $# -eq 0 ]`.
# (-0.1)
if [ -z $#]
then
	while read line
	do
        #   Okay, but you could have used `shortname=${line##*/}` instead.
        # It would be more standard.
		shortname=$(basename "$line")  # Mistyped identifier.
		#   Wrong subtitution syntax!  You do not need a second `$` for the
        # variable name.  Also, `%%` would be more preferable as the extension
        # may have multiple components (e.g. `.tar.gz`).  (-0.1)
		#shortname="${shortname%.*}"
		shortname="${$shortname%.*}"
		echo $shortname
	done  # You ommitted `done` for the `do`.
else
for file
do
	for line in $file
	do
	    # See the notes inside the first `if` clause.
		shortname=$(basename "$line")
		#shortname="${shortname%.*}"
		shortname="${$shortname%.*}"
		echo $shortname
	done
done
fi

# Total points for this task:  0.8/1
