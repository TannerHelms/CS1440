# CS 1440 Assignment 1 Rubric

| Points | Criteria
|:------:|--------------------------------------------------------------------------------
| 10     | Eligible error messages are displayed with `usage()`<br/> Errors that can reasonably be detected by your code are reported with `usage()`<br/> others are left to Python's error reporting
| 10     | cat & tac
| 10     | head & tail
| 10     | wc
| 10     | grep
| 10     | sort
| 15     | cut
| 15     | paste

**Total points: 90**

## Penalties


Review the [Course Rules](https://gitlab.cs.usu.edu/erik.falor/fa20-cs1440-lecturenotes/blob/master/Course_Rules.md) document to avoid general penalties which apply to all assignments.  In addition, this assignment is subject to the following penalties:

0.  **10 point penalty** if `eval()` is present in your program.  Remember, kids, [`eval()` is evil](https://thepythonguru.com/python-builtin-functions/eval/#evil-eval).
1.  **10 point penalty** for each instance of functionality occurring outside of the appropriate module.  This applies to text tool functions that are defined in `tt.py`.
2.  **10 point penalty** if your program prompts the user for any input.  All input to this program comes from command-line arguments or from files.
3.  **10 point penalty** if your program includes hard-coded paths.  Hard-coding the name of a directory or file may be convenient for you, but causes trouble for the graders who aren't using your laptop to run this program.  Names of modules in `import` statements and used as namespaces do not count as "hard-coded".
4.  **25 point penalty** if data files are not closed after being processed in *ordinary* situations.  In the event of an error your program will display an error message and immediately exit; in such cases you do not need to take special measures to close files because they will automatically be closed as your program exits.
5.  **50 point penalty** if `tt.py` fails to call out to functions defined in modules.
6.  **90 point penalty** if your program uses external programs to do any work.  The requirements are that you create a pure-Python solution, not a shell script that relies on an external program.
7.  **90 point penalty** if your program imports any modules besides `sys` and those provided by the assignment itself.  Your goal is to have the experience of solving these puzzles for yourself and not to leverage code written by others, no matter how "real-world" it would be to do so.
