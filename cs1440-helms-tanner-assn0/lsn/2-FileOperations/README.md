# Opening And Closing Files

## `open_close.py` Demonstration

`open_close.py` demonstrates how to open and close files in Python.

**Note: `open_close.py` does not contain any tasks to complete**

The crux of the demonstration are the two lines

```
fileObj = open("open_close.py")
```

and

```
fileObj.close()
```

This program also demonstrates how to display the current working directory as
well as how to access Python's internal documentation with the `help` function.

Run `open_close.py` from within the directory that contains it.



## Exercise 0

**Read section 0 of [`Reading_Files.md`](Reading_Files.md) before starting this exercise.**

This exercise tasks you with demonstrating your ability to open and close a
file. The provided code should list the current working directory to the user,
as well as prompt them for input to the file. After getting the users input, all
you need to do is:

*   Open the file object of the file `filename` from the user.
*   Give the file object to the provided function `concatenate`.
*   Close the file object when finished.

When you have completed `ex0.py`, try running it and opening `./data/text1.txt`,
`./data/text2`, and `./data/text3.mp3`. The contents of these files may expand
your knowledge of computer files!  In addition to that, try running `ex0.py` with
this directory as your current working directory, as well as from other
directories in the project. This process should assist you in understanding
relative file paths based on the current working directory.


## Exercise 1

**Read section 1 of [`Reading_Files.md`](Reading_Files.md) before starting this exercise**

If you have not had the pleasurable experience of requesting a non-existing
text file while experimenting with `ex0.py`, you have missed out on
crashing the program with a `FileNotFoundError`.

While there are techniques to catch errors in code *after* they happen, the
best course is to verifying that what we want to do is a good idea *before*
doing it.  A smart cliff diver would never take the plunge without first
verifying that the water is deep enough.  Be like the smart cliff diver and
look before you leap (even the our stakes are generally much lower).

*   `os.access()` is used to verify the existence of a file
*   `sys.exit()` allows you to quit the program at a specified point


Exercise 1 tasks you with completing the function `getFileSafely`. This function
should do the following:

*   Verify the existence of the file at `path`
*   If the file exists, congratulate the user for providing a valid file and
    exit the program and return the file object.
*   If the file does not exist, let the user know that the file they provided
    does not exist, and that they may or may not end up with broken legs next
    time they look before they leap. In other words, exit with "Exit Code 1".

When done correctly the user of this program will never encounter a `FileNotFoundError`.


# Exercise 2

**Read section 2 of [`Reading_Files.md`](Reading_Files.md) before starting this exercise**

After learning the functions `f.read()` and `f.readlines()`, return to complete
the following tasks:

*   Opening a user specified text file like in exercise 0.
*   Read and print the contents of the file using the method of your choice.
    *   This operation will be encased in the function `printContents1`
*   Read and print the contents of the file *again* using a different method.
    *   This operation will be encased in the function `printContents2`
*   Close the file

Given that you are now able to open a file safely, please implement the "look before you leap" features used in Exercise 1. Your program should not crash -- but should instead exit -- when it encounters an invalid file.

# Reflection and Application

In the above exercises you demonstrated knowledge of opening and closing files,
"looking before you leap" when it comes to opening files, as well as reading
and processing the contents of the file in multiple ways.  Having completed all
of the exercises, you have all of the tools you need to take on the DuckieDecrypter.

Continue on to your implementation of the DuckieDecrypter and apply your
newfound knowledge to develop your first piece of software here at DuckieCorp.
Always feel free to reach out to management if you have any questions.  Be sure
to read through the documentation again if necessary, as well as the Software
Development Plan and chunks of code a previous intern left you.
