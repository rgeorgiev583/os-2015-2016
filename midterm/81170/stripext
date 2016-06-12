#!/bin/bash

function cut_extension()
{
  local filename=$1
  #   Okay, but you could have used `basename=${filename##*/}` instead.
  # It would be more standard.
  local basename=$(basename $filename)

  #   This way, if you had a dot (`.`) in a directory name in the path,
  # everything after the directory name would be stripped.  This is not what is
  # required in the task.  (-0.1)
  # You could have used `${basename%%.*}` instead.
  echo ${basename/\.*/}
}

if [ $# -eq 0 ]
then
  #  That's redundant! You can fully omit the `input` variable.
  input=$(cat)

  while read -r line
  do
    cut_extension $line
  done <<< "$input"
  #  The upper line could just have been `done`, without `$input`.
else
  for filename
  do
    while read -r line
    do
      cut_extension $line
    done < "$filename"
  done
fi

# Total points for this task:  0.9/1
