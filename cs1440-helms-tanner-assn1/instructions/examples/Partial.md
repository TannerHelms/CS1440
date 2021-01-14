# Printing portions of a file (`head` and `tail`)

## head

The `head` tool prints the first lines of files.  When the file is less than or equal to 10 lines long `head` is the same as `cat`

    $ python src/tt.py head data/let3
    a
    b
    c


    $ python src/tt.py head data/names10
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


    $ python src/tt.py head data/words200 
    social
    insomniac
    implicitly
    cranky
    opponents
    clubroom
    uttering
    roughen
    easter
    dad



A different limit than 10 may be provided with the `-n` argument.  You'll need to convert this argument into a number yourself.

    $ python src/tt.py head -n 13 data/words200
    social
    insomniac
    implicitly
    cranky
    opponents
    clubroom
    uttering
    roughen
    easter
    dad
    sleighs
    honoraries
    smelt


    $ python src/tt.py head -n 1 data/words200
    social


When multiple files are given on the command line, identify each by preceeding their content with a banner:

    $ python src/tt.py head -n 3 data/ages8 data/names8 data/words200
    ==> data/ages8 <==
    Age
    22
    36

    ==> data/names8 <==
    Name
    Adrianna
    Julian

    ==> data/words200 <==
    social
    insomniac
    implicitly




## tail

`tail`, by contrast, prints the final 10 (or N) lines of a file.    When the file is less than or equal to 10 lines long `tail` is the same as `cat`

    $ python src/tt.py tail data/let3
    a
    b
    c



On longer files much of the content is suppressed in this way

    $ python src/tt.py tail data/words200
    convicting
    exacerbating
    indictment
    very
    impersonated
    latching
    reconfigurations
    activates
    autobiographies
    adverbs


As with `head`, a different number of lines is specified with the `-n` flag:

    $ python src/tt.py tail -n 4 data/words200
    reconfigurations
    activates
    autobiographies
    adverbs


    $ python src/tt.py tail -n 1 data/words200
    adverbs



Combining these tools enables one to extract a portion from the middle of a large file.  These commands use the shell's redirection operator `>` to extract words 80 - 97 from a list containing 200 words:

    $ python src/tt.py head -n 97 data/words200 > first97
    $ python src/tt.py tail -n 17 first97
    chrysanthemum
    malts
    draughts
    sterilizes
    hydrogen
    even
    pulsate
    upland
    outperforms
    subprogram
    lustiness
    handicap
    boom
    inhabiting
    improviser
    musicals
    the

 
When multiple files are given on the command line, identify each by preceeding their content with a banner:

    $ python src/tt.py tail -n 3 data/ages8 data/names8 data/words200
    ==> data/ages8 <==
    23
    29
    17

    ==> data/names8 <==
    Michael
    Marcus
    Julianna

    ==> data/words200 <==
    activates
    autobiographies
    adverbs



## Handling errors

The program aborts as soon as a non-existent, invalid or inaccessible file is encountered.  You do not need to pre-screen the arguments before you begin processing; just let `open()` raise an exception.

Your program must detect and report the case where too few arguments are given; at a minimum the name of one input file is required:

    $ python src/tt.py tail
    Error: Too few arguments

    tt.py head|tail [-n N] FILENAME...
            Output the first or last part of files
            -n  Number of lines to print (default is 10)


The `-n` option to these tools itself requires an argument in the form of an integer.  Alert the user when this number is left off:

    $ python src/tt.py head -n
    Error: Number of lines is required

    tt.py head|tail [-n N] FILENAME...
            Output the first or last part of files
            -n  Number of lines to print (default is 10)


Alert the user when this argument is *not* in the form of an integer.  Your program doesn't know that "seven" means the same thing as "7", and errors out:

    $ python src/tt.py head -n seven
    Error: Number of lines is required

    tt.py head|tail [-n N] FILENAME...
            Output the first or last part of files
            -n  Number of lines to print (default is 10)
