#!/bin/bash

for file in $1/*
do
	if ! [ -f $file ]
	then
		mkdir $file
	else
        #   `stat -c`, not `stat-c`.  (-0.1)
        #   Also, the `stat` commands have to be wrapped in a subshell
        # subtitution.  (-0.1)
        #   The whole subtree should be checked instead of only the basename.
        # (-0.2)
        #   The `find` condition should be a bit different.  Like this:  (-0.2)
		#if ! [ -f "$2/$file.gz" ] || (( stat-c %Y $2/$file.gz < stat-c %Y $file))
		if f=$( find "$2" -name "$file.gz" ) && (( stat-c %Y $f > stat-c %Y $file))
		then
		    #   `gzip -c $1/$file > $f` is more concise.
            # Also, `$f` might be empty if the file was not found.  (-0.1)
			cat $1/$file | gzip -c > $f
		fi
	fi
done

# Total points for this task:  0.3/1
