#!/bin/bash
#usage tkill TERM...

# Validation!  (+0.1)

if [[ $# -eq 0 ]]
then
	exit 1 #Error: too few arguments
fi
#else  # Fixed a syntax error.

for term
do
    #   `grep` won't work like that.  You don't pass `ps aux`'s output as an
    # argument; you rather pipe it into `grep`'s stdin.  (-0.2)
    #   Also, because there are whitespaces in each line, the output of the
    # aforementioned pipe cannot be passed to `for`.  It has to be piped into
    # `awk` instead, every line of which has to be passed to kill using
    # `xargs` or a shell substitution.  (-0.2)
    # Like this:
    #ps aux | grep "$term" | awk '{ print $2 }' | xargs kill
    # Or:
    #kill $(ps aux | grep "$term" | awk '{ print $2 }')
	for line in $(grep $(ps aux) "$term")
	do
        #   `cut` won't function properly here; `awk` is more suitable when
        # you've got delimiters wider than one character.  (-0.1)
        #   Additionally, the column number for the PID is wrong:  the PID is
        # listed in the second column of `ps aux`'s output.  (-0.1)
		kill "$(cut -f7 -d' ' $line)"
	done
done

# Total points for this task:  0.5/1
