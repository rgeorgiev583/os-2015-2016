# Fourth meeting

## Exercises

### `find` command

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
