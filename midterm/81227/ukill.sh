#!/bin/bash

# `in $*` is redundant here
for user in $*
do
#   `cut` won't function properly here; `awk` is more suitable when you've got delimiters wider than one character.  (-0.1)
#   `;` should actually be `|`.  (-0.1)
#   Where is `kill`?  (-0.1)
$(ps aux| grep $user; cut -f2 -d " ")
done
#   Again redundant.  Why would you have to exit at the end of the script when
# it is done automatically (with the same exit code)?
exit 0

# Total points for this task:  0.7/1
