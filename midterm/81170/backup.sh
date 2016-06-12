#!/bin/bash

src_dir=$1
dest_dir=$2

for filename in $(find "$src_dir" -type f)
do
  for filename_dest in $(find "$dest_dir" -type f)
  do
    #   Does not recreate directory tree (mkdir, etc)!  (-0.2)
    #   The whole subtree should be checked instead of only the basename.
    # (-0.2)
    if ! grep "$(basename $filename).gz" <<< "$filename_dest"
    then
      break 2
    fi
  done

  #   See the previous note.  This is not recursive.  Also, nowhere is the date
  # compared.  (-0.1)
  cp "$filename" "$dest_dir"
  #   `gzip -c` writes to stdout.  That's not really what you want.
  # What you want is just `gzip`.  (-0.1)
  gzip -c "$dest_dir/$(basename $filename)"
done

# Total points for this task:  0.4/1
