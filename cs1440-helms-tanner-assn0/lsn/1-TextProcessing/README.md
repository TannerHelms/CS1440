# Text Processing

This lesson focuses on processing text as a whole, rather than exclusively the character contents of a string. Throughout this lesson you will be dealing with the content of strings, sorting this data, eliminating unnecessary data, and decomposing this data into more manageable pieces.


## Exercise 0 -- [`ex0.py`](./ex0.py)

Create a function `findWords` that iterates through a *sentence* to build a
list of all strings that meet specific criteria.

```
Words that are 5 characters or less.
```

Please note that your `findWords` function will be required to work on *ALL*
lists of strings, not just the *provided* list. The *provided* list is just
testing data.  Management will run your function against other data sets.


## Exercise 1 -- [`ex1.py`](./ex1.py)

Create a function that returns a string containing every other word in the
given sentence. The sentence will be given as a string, containing letters and
punctuation separated by space characters ` `.  Construct and return a string
that reports `everyOtherWord` in the sentence.

*   Your implementation of the `everyOtherWord` function includes every other
    word in the resulting output, excluding the first word.
*   Punctuation should be preserved.
*   There should be a space character between each word.
*   An trailing space character is allowed at the end of the output string.

```
Input 1: A string of words.
Output 1: string words.

Input 2: A bit of redundancy is nice when it comes to understanding.
Output 2: bit redundancy nice it to
```


## Exercise 2 -- [`ex2.py`](./ex2.py)

Clean excess words from of a supplied string.  Your function `cleanSentence`
will return a list containing the words remaining in the provided string, with
words meeting select criteria removed.  All words starting with `#` should be
excluded from the output.

*   A word is any collection of characters separated by spaces, as in Exercise 1.
*   Punctuation should be preserved in the output.
*   There should be a space character between each word in the sentence.
*   The order of the words in the output should be preserved from the input.

```
Input: This #Contains sentence #some #other is #input #too. output.
Output: ["This", "sentence", "is", "output."]
```

Ensure that if an empty string is given, an empty list is returned.

```
Input:
Output: []
```

## Exercise 3 -- [`ex3.py`](./ex3.py)

This exercise is similar to exercise 2.

*   Create a function which parses through a sentence, returning lists of select content.
*   However, instead of eliminating the words that were removed, return them in a second list.
*   Separate words of the sentence into 2 groups, `clean` and `dirty`.
    *   `dirty` is a list of words marked with the special character `#`.
    *   `clean` contains words that are not marked with `#`.
    *   Return a list of lists, `[clean, dirty]`.
*   When adding a word to the `dirty` list, be sure to add it *with the special
    character removed from the word.*
*   When an empty string is given *both* lists are empty.

```
Input: This #Contains sentence #some #other is #input #too. output.
Output: (["This", ...], ["Contains", ...])
Output[0]: ["This", "sentence", "is", "output."]
Output[1]: ["Contains", "some", "other", "input", "too."]
```


# Reflection and Application

In these exercises, you learned how to loop through a list of words, and keep
only those that meet select criteria. You also learned how to split a line of
text into individual words using the `str.split()` function. In addition to
that, you worked on looping through multiple sentences, only keeping select
words in those sentences. You've come a long way in your work on text
processing, and many of these skills you have come to develop are directly
applicable to your DuckieDecrypter.

How are these applicable? Well, DuckieCrypt is a series of characters in a text
file separated by spaces. We know how to handle that. We also now know how to
look at a word, and determine whether or not it meets select criteria: which we
can use to verify that DuckieCrypt characters are valid while decrypting. We
also have learned how to look at the first character of a word, and determine
whether or not we want to keep the word in our sentence or not. How different is
this to the flags we must observe in a DuckieCrypt character?

Completing these exercises has hopefully helped prepare you for the
DuckieDecrypter you are tasked with creating. Continue on to the last practice
exercises, located at [../2-FileOperations](../2-FileOperations), that will
teach you how to properly handle files, and read the contents of them.
