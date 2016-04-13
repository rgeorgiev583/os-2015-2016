# Seventh meeting

# Some special variables
`$1` .. `$9`: the positional arguments passed to the shell script
`${10}` .. `${N}`: positional arguments after the ninth one must have their
numbers wrappers in `{}` or else the parser won't recognize them properly.
`$0`: name of shell script (or the shell if it was started interactively).
      NOT a positional parameter.
`$*`: all positional arguments, expanded in the following way: `"$1 $2 $3 $4"`,
      i.e. they are treated as one word and no word splitting is performed on
      them.
`$@`: all positional arguments, expanded in the following way:
     `"$1" "$2" "$3" "$4"`, i.e. they are treated as separate words.
`$#`: number of positional arguments.
`$?`: exit status of last terminated child process.
`$$`: PID of the shell.
`$!`: PID of the last executed background process.

# Brace expansion
`{a,b,c,...}`: when inside a pattern, expands to either of the
               options `a`, `b`, or `c`, etc. in a manner similar to glob
               patterns.
`{i..j}`: same thing but with the numbers from `i` to `j`.

For example `d{i,o}g` expands to `dig dog`, i.e. either `dig` or `dog`.

# Process substitution
`<(COMMAND)`: creates a named pipe, outputs its filename, redirects
              `COMMAND`'s stdout to the pipe, and executes `COMMAND`.

`>(COMMAND)`: creates a named pipe, outputs its filename, redirects
              `COMMAND`'s stdin to the pipe, and executes `COMMAND`.

# Functions
They behave like functions in C, except that they do not have formal parameters.
Instead, their arguments are stored in the numbered argument variables
`$1` .. `$9`, `${10}` .. `${N}`
(NOTE: `$0` is NOT the name of the function, it is still the name of the
executable, i.e. the shell script).

## Syntax one (POSIX)

    NAME()
    {
        COMMANDS
    }

## Syntax two

    function NAME
    {
        COMMANDS
    }


## Flow control in Bash


### `if` statement
`COMMANDS` are executed only if the exit code of `TEST` is zero (i.e. success).
(`TEST` is a command.)

    if TEST
    then
        COMMANDS
    fi


### The classic `for` loop
It iterates over the arguments (default behaviour), or over whatever is passed
after `in` in its syntax (of course, after word splitting is performed).

#### Looping through arguments

    for NAME
    do
        COMMANDS
    done

For example

    f()
    {
        for arg
        do
            echo $arg
        done
    }

    arg 1 2 3

would output

    1
    2
    3

#### Looping through lists

    for NAME in LIST
    do
        COMMANDS
    done

For example

    for i in foo bar baz quux
    do
        echo $i
    done

would output

    foo
    bar
    baz
    quux

#### Looping through glob patterns

    touch foo bar baz quux

    for i in *
    do
        echo $i
    done

would output the same thing (if these are the only files in the directory), and

    for i in $(ls)
    do
        echo $i
    done

too.

#### Nested fors
Like in every other language under the sun.

    for i in {1..10}  # guess why this works
    do
        for j in {11..20}
        do
            echo $(($i \* $j))  # why is \* escaped?
        done
    done

### C-style for
It is kinda ugly (for me, personally).

    for ((INITIALIZE; CONDITION; STEP))
    do
        COMMANDS
    done

Example:

    for (($i = 1; $i <= 10; $i++))
    do
        echo $i
    done


### `while` Looping
Executes `COMMANDS` while the exit code of `TEST` is zero.

    while TEST
    do
        COMMANDS
    done


