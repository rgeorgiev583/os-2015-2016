#!/bin/bash

#   Interesting solution!  The problem is that `du` includes directories in
# addition to files. You should use `wc -c` instead.  (-0.1)
#   Also, your script does not support multiple directories as arguments.  (-0.1)
#   The sorting should not be reversed using `-r`.  (-0.1)
#   Moreover, the numeric argument to `head` should be passed using a `-`.
# Like this:  `head -$1`  (-0.1)

find "$2" -type f | du -a | sort -rn | head $1

# Total points for this task:  0.6/1
