# Sorting files

## sort

For each input file named on the command line, `sort` prints the contents sorted in alphabetical order:

    $ python src/tt.py sort data/colors8
    Antique White
    Dark Goldenrod
    DarkSea Green
    Dodger Blue
    Favorite Color
    Light Salmon
    Midnight Blue
    Royal Blue
    Snow


Lines from all input files are sorted together into one output.  Notice that upper-case letters are sorted before the lower-case letters:

    $ python src/tt.py sort data/words5 data/names8
    Abraham
    Adrianna
    Julian
    Julianna
    Marcus
    Michael
    Name
    Savannah
    Tiffany
    agree
    babbles
    frankly
    sneakiness
    trimly


The results are surprising when one forgets that `sort` performs alphabetic
sorting on strings and is unaware that its input may look like numbers:

    $ python src/tt.py sort data/random20
    1
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    2
    20
    3
    4
    5
    6
    7
    8
    9


Reverse-sorted data can be obtained by first sorting in order with the `sort`
tool, then reversing the result with `tac`:

    $ python src/tt.py sort data/colors8 > sortedColors8

    $ python src/tt.py tac sortedColors8
    Snow
    Royal Blue
    Midnight Blue
    Light Salmon
    Favorite Color
    Dodger Blue
    DarkSea Green
    Dark Goldenrod
    Antique White


## Handling errors

The program aborts as soon as a non-existent, invalid or inaccessible file is encountered.  You do not need to pre-screen the arguments before you begin processing; just let `open()` raise an exception.

Your program must use `usage()` to raise an error when too few arguments are given; at a minimum the name of one input file is required.

    $ python src/tt.py sort
    Error: Too few arguments

    tt.py sort FILENAME...
            Output lines of text file in sorted order
