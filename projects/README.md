# Course project ideas

## Log rotator
*Recommended implementation language:* **bash**
*In a nutshell:* Your task is to write a log rotator, i.e. a program that manages the logs of other programs.

### Synopsis
**logrotate** [**-l** | **--limit**=*ROTATE_WHEN*] [**-c** | **--compress**] [**-C** | **--nocompress**] [**--compress-when**=*COMPRESS_WHEN*] [**--compress-cmd**=*COMPRESS_CMD*] [**--compress-ext**=*COMPRESS_EXT*] [**--compress-opt**=*COMPRESS_OPTIONS*] [[**-d** | **--delete**] [**-D** | **--nodelete**] [**--delete-when**=*DELETE_WHEN*] [**-m** | **--mail**] [**-M** | **-nomail**] [**--mail-cmd**=*MAIL_CMD*] [**-p** | **--prerotate-cmd**=*PREROTATE_CMD*] [**-P** | **--postrotate-cmd**=*POSTROTATE_CMD*] [**-n** | **--count-ext**] [**-t** | **--timestamp-ext**] [**-x** | **--ext**=*CUSTOM_EXT*] [**-y** | **--copy**] [**-t** | **--truncate**] [**--create**] [**--create-mode**=*CREATE_MODE*] [**--] [**-s** | **--config-file**=*CONFIG_FILE*]... *PATTERN*...
**logrotate** [**-?** | **-h** | **--help**]

### Description
Log rotation is used for dealing efficiently with large numbers of *log files*.
*Log files* are files generates by programs where they write whatever errors and warning messages occur during their use.
They are usually sorted in chronological order (i.e. the latest messages are appended to the end of the file) with each message on its own line, and usually begin with the date/time when the message occured, followed by the type of the message (error, warning, notice, etc.) and the actual text of the message.
A log rotator's task is to *rotate* log files.  *Rotation* of a log file means that the file is automatically renamed when its size grows over a certain limit.  The name of the new file (the *archived version*) usually consists of the old name (*basename*) with a `.` followed by a number (*log suffix*) appended.  Every time the log file grows over the limit, the number is automatically incremented.  If the log file's extension is `.log`, the log suffix is placed before the extension.
*For example:* `/var/log/kern.log` is renamed to `/var/log/kern.1.log` when its size exceeds the limit.  When this happens again, the newly created `/var/log/kern.log` is renamed to `/var/log/kern.2.log`, and so on.

*Invocation:* It should be invoked with filename pattern(s) as argument(s).
`logrotate FILE...`

### Patterns
These are **NOT** shell glob patterns; they are actually the basename of the log file (i.e. `/var/log/kern.log` or `/var/log/syslog` or `/var/log/messages`).  It is `logrotate`'s job to find all archived versions of the log file, and to determine the number of the latest archive.

## Hints
You can use the `sort` command to sort the archives which match the pattern.
You can use the `getopts` command to parse the short and long optional arguments.  For more info and tutorials on this topic:
* []()
* [Command line options: How to parse in bash using `getopt`](www.bahmanm.com/blogs/command-line-options-how-to-parse-in-bash-using-getopt)

### Configuration File Format

	[PATTERN]
	limit = ROTATE_WHEN
    compress = true | false
    compress-when =
    compress-cmd = gzip
    compress-ext = gz
    delete-when = 1000
    mail-cmd = mail -s
    prerotate-cmd = true
    postrotate-cmd = true
    timestamp-ext


## Log multiplexer daemon (*Bash*)
The idea is to create something which can 

## Symlink manager (*Bash*)


## Cron daemon (*Bash*)

## Package manager (*Bash*)

## Init daemon (*C*)

## Subcommand multiplexer (*C*)

## 

## Simple shell (C)
