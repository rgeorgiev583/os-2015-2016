#!/bin/bash

# Well done!

for username
do
  #   Interesting solution! But you could just have piped `ps aux`'s output to
  # `read` (or `grep`, alternatively). (+0.1)
  while read -r process
  do
    #   You could have used `echo $process | awk '{ print $1 }'`.
    # It's more standard than using `<<<`.
    if [[ $(awk '{ print $1 }' <<< "$process") == "$username" ]]
    then
      #   See the previous note.
      kill -KILL $(awk '{ print $2 }' <<< "$process")
    fi
  done < <(ps aux)
done

# Total points for this task:  1.1/1
