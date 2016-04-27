# Tenth meeting
## Review

## Part 1: Shell Review

* Create a new directory for the course in your home folder called lab.  Inside, create the following files:

	main.c, game.c, enemy.c, hero.c
	monster.h, human.h
	.highscore
	Music, Misc, Drivers

* Display all files starting with an e
* Copy all files starting with a capital letter to a new directory called capitals
* Delete all files whose extension is a single letter
* Rename both occurences of Misc folder to Test
* Delete all files containing m
* List all files containing a lowercase letter in their name, AND the nonexistant file named Hidden
* Now show the same list, but redirect standard output to a file
* Now show the same list, but redirect standard error to a file
* Combine 8 and 9: Redirect standard output to one file, and standard error to another
* Create 3 files: file1, file2, file3
* Use hostname to write the current host name into file1
* Prevent file clobbering
* Repeat (6). Did you get an error ?
* Fix the error keeping the noclobber option set

## Part 2: Environment

* Create a new directory named: I have $5
* Create an alias that finds all files larger than 2k but smaller than 5k
* Create an alias that finds all directories in /tmp owned by the current user
* Create an alias that finds all files modified within the last 4 hours
* Create a shell function that finds partial matches of a file name, so you could type: findpartial txt to get all files with txt in their name
* Create an alias for cp that turns it to cp -i
* Create an alias for rm that turns it to rm -i
* Create an alias that prints how many files exist under current directory
* Create an alias that prints how many executable files exist under current directory
* Create a shell function that takes a date and prints how many files were modified in that date

## Part 3: Getting Parameters

* Write a shell script that takes a file name as input and prints the file backwards
* Write a shell script that takes two file names as inputs, and replaces their contents.
* Write a shell script that reads a file name from the user, prints its contents and the number of lines in the file.
* Write a shell script that takes several file names as inputs, and copies itself to each of the files. Don't forget to set execute permissions on the target files.
* Write a shell script that takes a windows file (lines end with \r\n), and converts it to Unix file (lines end only with \n).

## Part 4: Conditionals

* Write a shell script that takes an input argument and tells if it's a string or a number (Hint: try expr a + 0)
* Write a shell script that takes 3 input arguments and prints out the largest one
* Write a shell script that reads a name from the user - if that name is an executable program run it, otherwise print its content.
* If it's not a file print an error message.
* Write a shell script that takes two file names, and prints the contents of the larger one.
* Write a shell script that asks the user for a number, if the user chooses 7 - print "You Win".
* Write a safedel script. The script takes a file name as command line input, and moves that file to a ~/TRASH directory instead of deleting it.
* Upon invocation, script should check ~/TRASH for files older than 48 hours and delete them.

## Part 5: Loops

* Write a shell script that takes input as command line arguments and prints them out backwards.
* Write a shell script called "wait_for_user" that takes a user name and checks if the user is logged in. If she's not logged in, the script sleeps for 5 seconds and checks again in a loop - until the user logs in.
* Write a shell script that reads a file name from the user, checks that the file is valid, and lowecases its name. For example, running lc MyFile should rename the file MyFile to myfile.
* Write a shell script that reads a file and prints its content double-spaced (adding a blank line after each line)
* Write a shell script that reads a file and prints its content with no blank lines.
* Write a shell script that reads a file and prints out only the longest line
* Write a shell script that takes a two file extensions as input (call them ext1 and ext2), and renames all files ending with ext1 to end with ext2.

## Part 6: Functions

* Write a shell function called sum that returns the sum of its arguments
* Write a shell function called countExecutables() that takes a directory name as parameter and returns the number of executable files in that directory.
* Write a shell function that prints out the multiplication table. Function should take a number n and print a table sized `n*n`.
* For example, running mul 5 should produce:

        1   2   3   4   5   
    1   1   2   3   4   5   
    2   2   4   6   8   10  
    3   3   6   9   12  15  
    4   4   8   12  16  20  
    5   5   10  15  20  25  

* Write a shell script that includes two functions: add_contact and email_contact.

* add_contact takes a name and an email.
* email_contact takes a name and some text, and sends the text to the contact's email address (as specified before when the contact was added).

Use a contacts.txt file to store the data.
