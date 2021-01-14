# ASCII Characters and Python's `chr()` and `ord()` functions

[ASCII](https://en.wikipedia.org/wiki/ASCII#Overview) is a 7-bit character
encoding that is standard in electronic communications.  Consisting of 128 unique
characters upon its conception, ASCII code was also conveniently used in the
development of DuckieCrypt. 

*   Python's `chr()` function converts an integer into its associated ASCII
    character.  For example, `chr(65)` returns the character `'A'`.
*   `ord()` converts a character into its ordinal value.  `ord("A")` returns
    the integer `65`.

### 2 Classes of ASCII characters

0.  The first 32 ASCII characters (corresponding with the integers `0-31`)
    along with the final character `127` are control characters.  Control
    characters are not printable; like Lovecraftian horrors they do not have a
    visible appearance that humans can comprehend.  When you try to look at
    them you (or your terminal) may be driven mad.  Control characters
    represent concepts such as *NULL*, *TAB*, *NEWLINE*, *BACKSPACE*, and more.
    The last (traditional) ASCII character is `127` *DELETE*.

1.  The remaining 95 characters (corresponding with integers `32-126`) are the
    printable characters.  These are the upper and lowercase letters, digits,
    and punctuation characters.

DuckieCrypt is not concerned with the control characters, only those that are
printable.  Thus, the ASCII characters DuckieCrypt can crypt are only the
printable ones, with integer values `32-126`.


## Exercise 0 -- [`ex0.py`](./ex0.py)

Create a function `displayASCII` that will display the printable ASCII
characters using the `chr` function. Your result should be something like:

```
chr(32) =  
chr(33) = !
chr(34) = "
...
chr(125) = }
chr(126) = ~
```

The output can be formatted however you like, but it should include the integer
value and the associated ASCII character of that character value. These
printable characters are the ASCII characters with integer values `32-126`. The
purpose of this exercise is to help you create a reusable piece of code for
reference while you are creating your DuckieDecrypter.

### F-strings
While doing this exercise, you may find Python's built-in literal string
interpolation--otherwise known as f-strings--to be helpful. Simply adding `f`
before the first `"` or `'` on a string literal will allow you to place
executable code inside the curly brackets, `{}`. [Be sure to press `f` to pay
your respects to PEP498, which was the addition of f-strings to the Python
language.](https://www.python.org/dev/peps/pep-0498/)

#### Example of f-strings in the REPL

```
>>> name = "Daryl The Duckie"
>>> age = 19
>>> f"Hi my name is {name} and I'm {age}!"
"Hi my name is Daryl The Duckie and I'm 19!"
```

## Exercise 1 -- [`ex1.py`](./ex1.py)

For this exercise, you are tasked to create a function `listOfChars` that takes
a list of integers and returns a list of the associated ASCII characters of the
integers.

```
Input: [65, 66, 67]
Output: ['A', 'B', 'C']
```

Your function should work on a list of any size. If a list of size 0 is given, a
list of size 0 can be returned. Assume the list given to the function will
always have valid integers that can be converted into an ASCII character. Do not
worry about the case of invalid input.


## Exercise 2 -- [`ex2.py`](./ex2.py)

For this exercise, you are tasked to create a function `listOfASCIIInts` that
takes either a list of characters *or* a string and returns a list of the
associated integer ASCII values.

```
Input 1: ['A', 'B', 'C']
Output 1: [65, 66, 67]

Input 2: "ABC"
Output 2: [65, 66, 67]
```

Your function should work on a list or string of any size. If a list or string
of size 0 is given, a list of size 0 can be returned. Assume the list given to
the function will always have valid characters that can be converted into their
associated ASCII integer. Do not worry about the case of invalid input.

Do not think too intently on the fact that your function must work on both a
list and string. You'll find many similarities in the way that python treats a
string and a list. For what it's worth: isn't a string just a *list of
characters?*

## Exercise 3 -- [`ex3.py`](./ex3.py)

For this exercise, you are going to use the `chr` and `ord` functions to find
the "score" of given words. You will complete the function `wordScore` that will
take a string of a word, and return the associated score of that word. To
determine the score of a word, we consider only the alphabetic characters.
Non-alphabetic characters add "0 points" to a words score. Upper and lowercase
characters each have the same score, with the lowest score belonging to the
character `A` and `a`, with a score of 0, and the characters with the highest
score being `Z` and `z`, with a score of 25. `B` and `b` has a score of 1, `C`
and `c` have a score of 2, with `Y` and `y` having a score of 24. The scores
increase with the ordinal positions of the characters in the alphabet.

Your function should work on a word of any size. It should not run into an error
in the event a non-alphabetic character is encountered, but should instead
ignore that character and continue through the rest of the characters in the
word. In other words, non-alphabetic characters have a score of 0. The score of
two words that only differ by their case should not be different. Many words may
have the same score, but the same word may not have two different scores. **If
the empty string is given, return a score of 0.**

```
Input 1: One
Output 1: 31

Input 2: oNe
Output 2: 31

Input 3: aAaA
Output 3: 0

Input 4: G0t it!
Output 4: 52
```


## Verification of Exercises 0-3

Run [`runTests.py`](./runTests.py) to verify whether or not you've successfully
completed the exercises located in the `0-ASCIIChars` directory. In your shell,
run `python runTests.py` to run all tests, or use `python runTests.py -h` to
learn how to run tests on specific exercises.

Please note that passing all of the supplied tests does **not** guarantee you a
great score during the code review process. There is always the possibility that
the tests may not test some functionalities of the program that the code
reviewer may test themselves. Also note that passing all of the tests is not a
requirement for a good grade during code review, these lessons are only a
portion of the overall project.


# Reflection and Application

In these exercises, you learned about ASCII characters and some of the ways to
manipulate them in Python. The exercises included building a reference table for
ASCII characters, converting characters to their ordinal values and vice versa,
as well as "scoring" words based on the alphabetical position of the characters
in the word. The work you've done here will assist you in creating the
DuckieCrypt Decrypter.

As you were working through the 3rd exercise, you may have noticed some
similarities in the way we scored individual characters to the character codes
of the upper and lowercase letters. The character codes for each upper and
lowercase DuckieCrypt characters corresponds directly with the score for each of
the characters. For example, the DuckieCrypt characters `^0` and `_0` translates
to the characters `A` and `a` respectively. Similarly, `^25` and `_25` translate
to `Z` and `z`. To properly complete exercise 3, you needed to translate the
characters into the integers [0, 25], and to decrypt DuckieCrypt you will need
to do the reverse.

You may also find from looking at your ASCII character table that DuckieCrypts
special character definitions conveniently match up with select ASCII characters
in the range `[32, 126]`. It may be a good idea to look over the distribution of
the non-alphabetic characters in your ASCII table from `ex0.py`, and compare
this to the character table for special characters. Hopefully you will find the
pattern that was utilized in creating DuckieCrypt.

Finishing these exercises should have served as a refresher in Python, as well
as a learning experience of select Python tools to assist you in creating the
DuckieDecrypter. Continue on to the next set of exercises dedicated to text
processing, located at [../1-TextProcessing](../1-TextProcessing), to learn more
tips and tricks that will assist you in crafting the DuckieDecrypter.
