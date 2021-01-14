# Assignment 0 Hints

0. Familiarize yourself with the `demo/duckieEncrypter.py` file to assist you in understanding DuckieCrypt. When invoking the file, add the optional argument `-h` or `--help` for a detailed usage message.

1. ASCII characters were of significant importance in the creation of DuckieCrypt. In fact, the mapping of the integer portions of the character codes follow similar patterns as the mapping of ASCII characters. While trying to create the DuckieDecrypter and learning how to handle DuckieCrypt, keep your ASCII character table handy!

2. An average implementation of the DuckieDecrypter can be done in a relatively short amount of code (100-200 lines, or less). Don't over think the assignment and write redundant code that can be accomplished by Python's built in tools.

3. Familiarize yourself with these key functions, which are integral to completing the DuckieDecrypter, as well as completion of the learning exercises associated with this assignment.

* `chr()`
* `ord()`
* `int()`
* `len()`
* `open()`
* `close()`
* `os.R_OK`
* `os.access()`
* `print()`
* `str.split()`
* and many more!

Don't be afraid to invoke `help([func_name])` in the REPL to learn more about select functions!

```
$ python -i
>>> help(print)
Help on built-in function print in module builtins:

print(...)
    print(value, ..., sep=' ', end='\n', file=sys.stdout, flush=False)

    Prints the values to a stream, or to sys.stdout by default.
    Optional keyword arguments:
    file:  a file-like object (stream); defaults to the current sys.stdout.
    sep:   string inserted between values, default a space.
    end:   string appended after the last value, default a newline.
    flush: whether to forcibly flush the stream.
>>> help(str.split)

Help on method_descriptor:
split(self, /, sep=None, maxsplit=-1)
    Return a list of the words in the string, using sep as the delimiter string.

    sep
      The delimiter according which to split the string.
      None (the default value) means split according to any whitespace,
      and discard empty strings from the result.
    maxsplit
      Maximum number of splits to do.
      -1 (the default value) means no limit.
```

4. Once you have implemented looking at the flags to determine which character type each DuckieCrypt Character is, how different of a task will it be to determine the special characters group?
