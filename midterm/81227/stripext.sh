#!/bin/bash

#   Files provided as arguments are not handled at all!  (-0.2)
if [ $# -eq 0 ]; then
#   It is preferable to use `read -r` to just `read`.
while read line
do
#   `cut` is not enough in this case; you have to use variable substitutions,
# like this:  (-0.3)
#line=${line##*/}
#line=${line%%.*}
cut -f1 -d "." "$line"
done
fi

# Total points for this task:  0.5/1
