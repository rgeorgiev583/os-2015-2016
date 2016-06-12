#!/bin/bash
#usage ttys USER...

# Validation! (+0.1)

if [[ $# -eq 0 ]]
then
	exit 1 #Error: too few arguments
fi
#else  # Fixed a syntax error.

for user
do
    #   `cut` won't function properly here; `awk` is more suitable when
    # you've got delimiters wider than one character.  (-0.1)
    # Like this:
	#who | grep "$user" | awk '{ print $2 }'
	who | grep "$user" | cut -f2 -d$'\t'
done

# Total points for this task:  1/1
