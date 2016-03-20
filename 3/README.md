# Third meeting

## Basic commands and `bash` concepts #2

Unix commands are simple tools which only do one task, and have to be combined
using the various I/O redirection mechanisms of the shell to produce meaningful
output.
As a rule of thumb, Unix commands generally accept text input and produce text
output which has to be parsed in some way.  You could say that they communicate
using a text-based API.

Most Unix commmands accept a variable number of files as arguments
(though most often only one file is passed as an argument).
If no files are passed as arguments, the command usually reads from the
standard input.

Most commands accept options of the type `-o` or `-o ARG` where `o` is the
option letter and `ARG` is an argument (which may or may not be option).
Usually the whitespace between the option letter and the argument is not
significant (i.e. it does not matter if there is any of it).
Options can be passed sequentially, like this: `cmd -a -b foo`, or combined
like this: `cmd -abfoo` (these command lines are equivalent).

### cat

`$ cat FILE...`
Concatenates the `FILE`s in the given order and writes the result to the
standard output.

However, it is used more frequently to output one `FILE`'s content:
`$ cat FILE`

or to read information from the standard input and write it to a file:
`$ cat > FILE`

### head

`$ head -N FILE...`
Writes the first `N` lines from each `FILE` to the standard output.

`$ head -cN FILE...`
Writes the first `N` characters from each `FILE` to the standard output.

### tail

`$ tail -N FILE...`
Writes the last `N` lines from each `FILE` to the standard output.

`$ tail -cN FILE...`
Writes the last `N` characters from each `FILE` to the standard output.

### grep
`$ grep OPTIONS PATTERN FILE...`
Outputs the lines in `FILE` which match the given `PATTERN` (it is a regex).

`OPTIONS` can be any (or none) of:
* `-i`: make `PATTERN` case insensitive
* `-v`: negate `PATTERN`, i.e. match anything which it does not match

Example:

    $ cat > foo
    what the hell
    is this !@#$
    $ grep what foo
    what the hell

### cut

`$ cut -d DELIM -f N FILE...`
For each line, output the `N`th column delimited by `DELIM`. This includes empty
columns (i.e. adjacent delimiters).
Space must be wrapped in quotes (obviously).

Example:

    $ cat > foo
    what the hell
    is this !@#$
    $ cut -d' ' -f2 foo
    the
    this

### wc

`$ wc OPTIONS FILE...`
Output the count of bytes/words/lines in each `FILE`.
If no options are given, output each of the three.

`OPTIONS` can be any (or none) of:
* `-c`: output byte count
* `-w`: output word count
* `-l`: output line count

### file

`$ file FILE...`
Display the file types for each FILE.

### I/O redirection

#### Redirection from/to file

`$ cmd > file`
Makes `cmd` write to `file` instead to the standard output.

`$ cmd < file`
Makes `cmd` read from `file` instead from the standard input.

Example:

    $ cat > foo
    omg
    $ wc -c foo
    4 foo
    $ wc -c < foo
    4

#### Pipes and pipelines

`$ cmd1 | cmd2`
Makes `cmd2` read from `cmd1`'s output, i.e. redirects `cmd1`'s output to
`cmd2`'s input.
Pipes can be composed into pipelines consisting of multiple pipes joined
together.

Example 1 (simple pipe):

    $ cat > foo
    what the hell
    is this !@#$
    $ grep what foo | wc -c
    14

Example 2 (pipeline):

    $ cat > foo
    what the hell
    is this !@#$
    $ grep what foo | cut -d' ' -f2 | wc -c
    4

### For a more detailed understanding

* `man bash`
* [The Bash Hackers Wiki](http://wiki.bash-hackers.org/): this one is
  definitely the most extensive and useful resource on Bash
* [GNU Bash](https://www.gnu.org/software/bash/)
* [BASH Programming - Introduction HOW-TO](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html)
* [Bash Guide for Beginners](http://www.tldp.org/LDP/Bash-Beginners-Guide/html/)
* (Advanced Bash-Scripting Guide)[http://www.tldp.org/LDP/abs/html/]

### Exercises

Using the commands learned so far, write a `bash` command line to:

1. Output the processor model name from the `/proc/cpuinfo` file.
2. Output the amount of free memory from the `/proc/meminfo` file.
3. Output all names of groups in which the `daemon` user participates
   (group info is stored in `/etc/group`).
4. Output the pseudo-terminal names (the `TTY` column) for each `bash` instance
   (use the output of the `ps ax` command line invocation).
