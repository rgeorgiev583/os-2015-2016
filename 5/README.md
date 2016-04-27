# Fifth meeting

## Diff

`diff OPTIONS FILES...`
Outputs the differences between the FILES.

OPTIONS can be one (or none) of:
`-q`: only output which files differ
`-s`: only output which files are the same
`-u`: shows the differences in the following format (unified context diff):

if the command is `diff -u FROM TO`:

    --- FROM FROM_LAST_MODIFICATION_DATE
    +++ TO TO_LAST_MODIFICATION_DATE
    CHANGES

where `CHANGES` has the following format:

    @@ -PRE_BEGIN_LINE_NUM,PRE_LINE_COUNT +POST_BEGIN_LINE_NUM,POST_LINE_COUNT
    PRE_CONTEXT
    - REMOVED_LINE
    ...
    + ADDED_LINE
    ...
    POST_CONTEXT

## `ps` and `kill`

`ps OPTIONS`
Shows info about processes.

`a`: show info about all processes, not only the children of (processes started
by) the shell
`u`: show info about processes which not do not have an associated terminal
(i.e. daemons)
`x`: show detailed info about processes

## `cmd &`
Starts the command in the background of the shell (usually the shell goes to
the foreground).

## `fg`
Bring the background process into the foreground.

##* Ctrl+Z
Pause the current process and bring in into the background.

## `bg`
Restore the paused process in the background.
