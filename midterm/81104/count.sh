#!/bin/bash
#usage count EXT DIR...

# Validation!  (+0.1)

if [[ $# -lt 2 ]]
then
	exit 1 #Error: too few arguments
fi
#else  # Fixed a syntax error.
i=0
for dir in ${@:2}
do
	for filename in $(find "$dir" -type f)
	do
        #   Quotes (`""`) do not go well with the `[[` command.
        # Avoid them when using that command.  (-0.1)
        # Like this:
		#if [[ $filename == *.$1 ]]
		if [[ "$filename" == "*.$1" ]]
		then
            # There's no such command in Bash.  Use `i=$(($i + 1))`.  (-0.1)
            i++
		fi
	done
	echo "$i files in $dir"
	i=0
done

# Total points for this task:  0.9/1
