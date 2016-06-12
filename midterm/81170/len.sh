#!/bin/bash

# Excellent!

ext=$1
shift

for dir
do
  for filename in $(find "$dir" -type f -name "*$ext" 2> /dev/null)
  do
    echo "$filename: $(wc -c < "$filename")"
  done
done

# Total points for this task:  1/1
