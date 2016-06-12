#!/bin/bash

# Yay, argument validation!  (+0.1)
if [ $# -ne 2 ]; then
# `exit` is not used like that.  This is not C.
#exit(99)
exit 99
fi

#   `cd` is used (it shouldn't be)!
cd $1;
#   `ls` is used instead of find.  (-0.3)
for file in $(ls)
do
#   `echo` is redundant here.  (-0.1)
zipped_file=echo $file.gz
#   The `> date +%s -d` part is probably not what you want.  Also, it is
# invalid syntax.  Even if the command was put in a subshell
# (like `> $(date +%s)`), it would just write `stat`'s output to a file with
# a timestamp as a name.  (-0.2)
first_date=$(stat -c %Y $file > date +%s -d)
#   See the note for `cd`.  Also, the directory is not the correct one.  (-0.1)
cd ~/$2;
#   See the note for `ls`.
if [ ls |grep $zipped_file ]; then
#   See the note for `first_date`.
second_date=$(stat -c %Y $zipped_file > date +%s -d)
#   Variables have to be substituted with `$`, just listing their names won't
# suffice.  Like this:  (-0.1)
#if [ $first_date -gt $second_date ]; then
   if [ first_date -gt second_date ]; then
#   The command, used like this, would output the gzipped file to stdout.
# This most certainly isn't what you want.  (-0.1)
       gzip -c $file
   fi
else
#   See the previous note.
	gzip -c $file
fi
done

# Total points for this task:  0.2/1
