#!/bin/bash

for dir in ${@:2}
do
#   It is not good practice to use `cd` in shell scripts (it introduces one of
# the worst forms of dependence on state)!  In cases where it cannot be avoided,
# you can use `pushd` and `popd`.
cd ./$dir
#   You should have used `find` as `ls` is not suitable for traversing
# directories recursively.  Additionally, its output is not stable.
# Moreover, `-p` is useless in this context.  (-0.3)
#   Also, `grep "$1\$"` would be more precise than just `grep $1` as it would
# only look at the end of the filename (i.e. the extension).
#   `ls -s` won't work like that.  You don't pipe output to its stdin; you
# rather pass the filenames as arguments.  Also, `-s` is not usable for getting
# file size (it displays the size of the allocated blocks); `wc -c` has to be
# used for the actual file size: with arguments from `ls`'s output.
# To do this, you can use `xargs` or shell substitution.  (-0.2)
#   Finally, the second `grep` is absolutely unnecessary.  It does not do
# anything of significance.  (-0.1)
ls -p| grep $1| ls -s |grep -e [1...9]
#   Are you sure that the user would run the script from their home directory
# to be able to do things like that?  You could just have used `cd -`.  (-0.1)
cd ~
done

# Total points for this task:  0.3/1
