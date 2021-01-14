# CS 1440 Assignment 0 Rubric

| Points | Criteria
|:------:|--------------------------------------------------------------------------------
| 5      | Git repository is a clone of the starter code, and contains 5 *new* commits
| 5      | Documentation is filled out and proper DuckieCorp coding conventions are followed in the project
| 10     | The exercises in lsn/0-ASCIIChars are complete and pass the associated Unit Tests
| 10     | The exercises in lsn/1-TextProcessing are complete and pass the associated Unit Tests
| 10     | The exercises in lsn/2-FileOperations are complete and pass the associated Unit Tests
| 10     | User is prompted for text file. File existence and accessibility is checked before attempting to open requested file
| 10     | Special characters are correctly deciphered from DuckieCrypt
| 10     | Uppercase and Lowercase characters are correctly deciphered from DuckieCrypt
| 5      | The whole composition of the message is preserved, including white space and newlines. No extra characters are added to the output

**Total points: 75**

## Penalties
Review the [Course Rules](https://gitlab.cs.usu.edu/erik.falor/sp20-cs1440-lecturenotes/blob/master/Course_Rules.md) document to avoid general penalties which apply to all assignments.  In addition, this assignment is subject to the following penalties:

0.  **10 point penalty** if your program includes hard-coded paths.  Hard-coding the name of a directory or file may be convenient for you, but causes trouble for the graders who aren't using your laptop to run this program.  Names of modules in `import` statements and used as namespaces do not count as "hard-coded".
0.  **25 point penalty** if data files are not closed after being processed in *ordinary* situations.  In the event of an error your program will display an error message and immediately exit; in such cases you do not need to take special measures to close files because they will automatically be closed as your program exits.
0.  **75 point penalty** if your program uses external programs to do any work.  The requirements are that you create a pure-Python solution, not a shell script that relies on an external program.
0.  **75 point penalty** if your program imports any modules besides `sys`, `os`, and ones you create.  Your goal is to have the experience of solving these puzzles for yourself and not to leverage code written by others, no matter how "real-world" it would be to do so.
0.  **Variable point penalties** for other violations of course rules, course conduct, course conventions, and for any additional reasons deemed necessary by DuckieCorp management.
