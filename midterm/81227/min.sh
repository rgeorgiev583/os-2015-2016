#!/bin/bash

#   You have to support multiple directories as arguments.
# Additionally, the arguments' order is reversed (the number goes first).
# (-0.1)
#   It is not good practice to use `cd` in shell scripts (it introduces one of
# the worst forms of dependence on state)!  In cases where it cannot be avoided,
# you can use `pushd` and `popd`.
#   You should have used `find` as `ls` is not suitable for traversing
# directories recursively.  Additionally, its output is not stable.  (-0.3)
#   `ls -s` won't work like that.  You don't pipe output to its stdin; you
# rather pass the filenames as arguments.  Also, `-s` is not usable for getting
# file size (it displays the size of the allocated blocks); `wc -c` has to be
# used for the actual file size: with arguments from `ls`'s output.
# To do this, you can use `xargs` or shell substitution.  (-0.2)
cd $1;ls -s|sort -n| head --lines=$2

# Total points for this task:  0.4/1
