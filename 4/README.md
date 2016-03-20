# Fourth meeting

## `find` command

### Very basic syntax

`find FILE... EXPRESSION`
where `FILE` is a list of files (including directories) to search in and
`EXPRESSION` describes what we want to find.
`EXPRESSION` can contain any of the following (which may or may not match a
file):
* `-name NAME`: `NAME` can be a filename or a shell glob pattern which matches
  the files we want to find.
* `-type TYPE`: `TYPE` can be `-f` for matching regular files or `-d` for
  directories.
* `-path PATH`: `PATH` matches a whole path relative to one of the `FILE`s
  given as argument.
* `-regex REGEX`: like `-name` but using a regular expression.
* `-exec CMD \;`: executes shell command `CMD` for each file matched, replacing
  all instances of `{}` in `CMD` with the path to the file.

These things can be recursively combined using the following operations:
* ! `EXPR`: logical NOT: negates `EXPR`:
  matches if `EXPR` does not matches and vice versa.
* `EXPR1` `EXPR2`: logical AND: matches if both `EXPR1` and `EXPR2` match.
* `EXPR1` -o `EXPR2`: logical OR: matches if `EXPR1` or `EXPR2` matches.
* \( `EXPR` \): changes th priority of `EXPR`.  For example:
  \( `EXPR1` -o `EXPR2` \) 'EXPR3' evaluates the OR before the AND,
  contrary to normal operator precedence (AND before OR).

### Overview of semantics (how `find` works)

For each `FILE` given as argument, `find` does one of the following things:
* if `FILE` is a regular file, it checks if `EXPRESSION` matches `FILE`.
  If it does, the relative path to `FILE` is printed on STDOUT.
* if `FILE` is a directory, it follows the first rule for each regular file in
  the directory and recursively applies this rule for each subdirectory.

### For a more detailed understanding

* `man find`
* [A collection of Unix/Linux find command examples](http://alvinalexander.com/unix/edu/examples/find.shtml)
* [UNIX Find A File Command](http://www.cyberciti.biz/faq/howto-find-a-file-under-unix/)
* [Wikibook ****Guide to Unix*, chapter *Finding Files*](https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/Finding_Files)
* [Wikipedia](https://en.wikipedia.org/wiki/Find)

### Exercises

1. Copy all (regular) files in the `/bin` directory which begin with `mk` to
   the `/tmp/$USER` directory.

2. Write all lines which begin with a `[` character in all `*.conf` files in
   the `/etc` directory to the `/tmp/$USER/headers` file.
   (The regex syntax for matching something in the beginning is `^`.)

3. Write all lines which contain a `=` character for each `*.conf` file named
   NAME in the `/etc` directory to a `/tmp/$USER/NAME` file.
   (*NAME* is the base filename, i.e. the filename without the directory.)

   3.1. Like exercise 3. but replace `.conf` in NAME with `.settings`.

4. Create an `etc` directory in `/tmp/$USER` and move the `*.conf` files which
   we created in exercise 3. to that directory.

### Solutions

In this directory.
