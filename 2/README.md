# Second meeting

## Basic commands and `bash` concepts

### pwd
Outputs the current working directory of the shell.

### echo

`echo OPTIONS ARGS...`
Outputs each of `ARGS`, separated by a space.

`OPTIONS` can be any (or none) of:
* `-n`: do not output a newline
* `-e`: interpret escape sequences

Example:

    $ echo    foo  bar   baz
    foo bar baz
    $ echo -e 'foo\nbar'
    foo
    bar

### date
Outputs the current date.

Example:

    $ date
    нд мар 20 18:54:41 EET 2016
    $ date +%s
    1458492893

### ls

`ls OPTIONS FILE...`
List the files in `FILE`s (if they are directories).

`OPTIONS` can be any (or none) of:
* `-l`: list detailed information in a table
* `-a`: include hidden files and `.` and `..`
* `-h`: display sizes in human-readable units

### cd

`cd DIR`

Change the current working directory to `DIR`.
If no argument is given, it is set to `$HOME`.
If `-` is given as argument, it is set to the previous working directory.

### man

`man CMD`

Displays the manual page for `CMD`.
It contains detailed information on the command's usage.

### who
Outputs info about the users currently logged onto the computer.
