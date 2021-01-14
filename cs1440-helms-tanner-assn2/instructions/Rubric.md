# CS 1440 Assignment 2 Rubric

| Points | Criteria
|:------:|--------------------------------------------------------------------------------
| 20     | Count of FIPS areas<br/>In both datasets the correct number of FIPS areas are recognized
| 10     | Total wages<br/>The value for total wages earned is correct in both datasets
| 10     | Max wages & area<br/>The area with the maximum wages paid is identified and reported
| 10     | Total no. of establishments<br/>The value for total number of establishments is correct in both datasets
| 10     | Max no. of establishments & area<br/>The area with the maximum number of establishments is identified and reported
| 10     | Total employment level<br/>The value for the total employment level is correct in both datasets
| 10     | Max employment level & area<br/>The area with the maximum employment level is identified and reported
| 20     | Command-line interface matches requirements<br/>The user may select a dataset directory at runtime.<br/>Error messages are displayed when an invalid dataset directory is specified.

**Total points: 100**


## Penalties

Review the [Course Rules](https://gitlab.cs.usu.edu/erik.falor/fa20-cs1440-lecturenotes/blob/master/Course_Rules.md)
document to avoid general penalties which apply to all assignments.  
Don't forget your Sprint Signature and Software Development Plan.

Additionally, this assignment is subject to the following penalties:


0.  **10 point penalty** if `eval()` or a similar function is used by your
    program.  You should use `int()` instead.
1.  **10 point penalty** if your program prompts the user for any input.  This
    is not an interactive program.  All input to the program comes from
    command-line arguments and files.
2.  **10 point penalty** if your program includes hard-coded directories.
    Hard-coding the name of a directory may be convenient for you, but causes
    trouble for the graders who aren't using your laptop to run this program.
    This penalty includes instances of `..` in paths.  Names of modules given
    in `import` statements and used as namespaces do not count as hard coded.
3.  **10 point penalty** Your program *must* hard code the filenames
    `area_titles.csv` and `2019.annual.singlefile.csv` exactly as given.  Do
    not rename these files on your computer or in your code as this will cause
    your program to fail when we grade it.
4.  **10 point penalty** if any files are not closed after being processed in
    _ordinary_ situations.  In the event of an error your program will display
    an error message and immediately exit; in such cases you do not need to
    take special measures to close files because they are automatically closed
    as your program exits.
5.  **10 point penalty** if your program uses external programs to do any work
    (including programs you wrote yourself).  This program is a pure-Python
    solution, not a shell script that relies on an external program.
6.  **10 point penalty** if your program imports any modules besides `sys`,
    `time`, `Report`, or modules you wrote yourself.  This assignment is about
    the experience of solving this puzzle for yourself without leaning on code
    written by others, no matter how "real-world" it would be to do so.
7.  **1 point penalty** per megabyte of CSV or ZIP files in your repository
    (`area_titles.csv` excepted).  If you accidentally commit a huge CSV file
    come visit me for help.
8.  **2 point penalty** per line of output on `sys.stdout` that is not due to
    printing the `Report` object.  Output to `sys.stderr` is permitted.


### What about Python's standard `csv` module?

To expand upon point #6, there exists a Python module named `csv` for
processing CSV data.  **You cannot use it to complete this assignment.**

For one thing, `csv` provides no essential capabilities that you can't
trivially achieve with Python's built-in `str` class.

More importantly, the point of this assignment is to teach you how to process
data generally.  The `csv` module won't teach you how to solve problems when
your data comes in a different format than CSV.  Put another way, CSV is a
subset of plain text data.  If you know how to deal with plain text, you can
deal with CSV; but the converse isn't necessarily true.  You limit yourself if
you are only able to solve problems when somebody has already written a module.
You should strive to be the kind of programmer who *makes* modules others rely
on.
