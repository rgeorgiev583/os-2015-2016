#!/bin/bash

#   Files provided as arguments are not handled at all!  (-0.1)
if [ $# -eq 0 ]; then
#   It is preferable to use `read -r` to just `read`.
while read line
do
#   `cut` is not useful in this case; you have to use variable substitutions,
# like this:  (-0.3)
#line=${line##*/}
#line=${line%%.*}
#   Also, `$line` should be piped into `cut`'s input, not passed as an argument.
# Like this:  (-0.2)
#echo "$line" | cut -f1 -d "."
cut -f1 -d "." "$line"
done
fi

# Total points for this task:  0.4/1
