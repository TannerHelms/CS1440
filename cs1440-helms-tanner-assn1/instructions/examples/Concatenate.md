# Forward and reverse concatenation tools (`cat` and `tac`)


## cat
Concatenate two files into one output

    $ python src/tt.py cat data/let3 data/num2 
    a
    b
    c
    1
    2


Ordinarily, `cat` is used by Unix hackers to print a file to the screen

    $ python src/tt.py cat data/names10 
    Jerry
    Bailey
    Frank
    Kai
    Angela
    Mikayla
    Hazel
    Karen
    Alexa
    Isabel



## tac
`tac` works just like `cat`, only backwards

    $ python src/tt.py tac data/let3 data/num2 
    c
    b
    a
    2
    1


    $ python src/tt.py tac data/names10 
    Isabel
    Alexa
    Karen
    Hazel
    Mikayla
    Angela
    Kai
    Frank
    Bailey
    Jerry


## Handling errors

The program aborts as soon as a non-existent, invalid or inaccessible file is encountered.  You do not need to pre-screen the arguments before you begin processing; just let `open()` raise an exception.

Your program must use `usage()` to raise an error when too few arguments are given; at a minimum the name of one input file is required.

    $ python src/tt.py tac
    Error: Too few arguments

    tt.py cat|tac FILENAME...
        Concatenate and print files in order or in reverse
