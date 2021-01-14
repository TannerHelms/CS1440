# Using the lessons

## Running `runTests.py` In A Lessons Directory

*   Use `cd` to enter one of the lesson directories.
*   Launch Python with the `runTests.py` file to run all of the tests in the lesson.

**Example**

```
$ cd 0-ASCIIChars
$ python runTests.py

Welcome to the DuckieCorp's automated testing system! Verify if you have
successfully completed the requested lesson exercises.
You have requested tests on the following exercises:
    ASCII Characters Exercise 0
    ASCII Characters Exercise 1
    ASCII Characters Exercise 2
    ASCII Characters Exercise 3

[Wall of text goes here]

```

A lot of text will be printed.  Don't be scared, it's just trying to help!

Start from the top, complete each lesson, and work your way down to the bottom.  As you go you will turn the scary red errors into pleasant green compliments.

You can focus on just one exercise at a time by giving `runTests.py` extra arguments:


### Run all tests
```
$ python runTests.py
```

### Test only exercises 1 and 3
```
$ python runTests.py 1 3
```

### Printing the `runTests.py` usage message
```
$ python runTests.py -h
USAGE: $ python runTests.py [TESTS]

If [TESTS] is ommitted, the program will run all provided tests against the
exercises.

[TESTS] is an optional parameter of space separated integers. This is
provided only if the user wants to run specific tests. To run only tests
against exercises 0 and 3, one would input `python runTests.py 0 3`.

The following tests can be run:
    0 : ASCII Characters Exercise 0
    1 : ASCII Characters Exercise 1
    2 : ASCII Characters Exercise 2
    3 : ASCII Characters Exercise 3
```
