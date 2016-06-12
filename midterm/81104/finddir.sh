#!/bin/bash
#usage finddir FILE...

function getDir(){
	local filename=$1
    #   Interesting solution!  (+0.1)
    # But you could have used the following one, which is simpler:
    #filename=${filename%/*}
    #echo ${filename##*/}
	echo "$filename" | rev | cut -d'/' -f2 | rev
}

# There's boilerplate code in the `if` and `else` clauses...
if [[ $# -eq 0 ]]
then
    # That's redundant! You can fully omit the `input` variable.
	input=$(cat)
    # One of the `while`s is useless.  (-0.1)
    # `-r` is used!  Congrats!  (+0.1)
	#while read -r line
	#do
		while read -r p
		do
			getDir $p
		#done <$line
	done < $input
    #   The upper line could just have been `done`, without `$input`.
    #   Also, `$input` is not passed correctly to the `while`.  The statement
    # should have been the following:  (-0.1)
    #while read -r p
    #do
        #getDir $p
    #done
    # Or, alternatively, `$input` may be piped into `while` like this:
    #echo $input | while read -r p
    #...
#fi  # If you must have an `else` clause, do not put a `fi` before it.  (-0.1)

else
    # See the notes inside the `if` clause.
	for filename
	do
		while read -r p
		do
			getDir $p
		done <$filename
	done
fi

# Total points for this task:  0.9/1
