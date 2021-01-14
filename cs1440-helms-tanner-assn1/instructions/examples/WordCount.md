# Word Count tool (`wc`)

The `wc` tool counts and prints the number of lines, words, and characters (bytes) present in a text file.  Note that, due to differences in the representation of the end-of-line (EOL) sequence between operating systems, the byte count you see on Windows may vary from my examples.  The character and word counts should remain the same.  These examples were produced on Linux.

This example reports that the file `data/num2` contains two lines, two words, and four characters

    $ python src/tt.py wc data/num2
    2	2	4	data/num2


This example reports that the file `data/words200` contains 200 lines, 200 words, and 1790 characters

    $ python src/tt.py wc data/words200
    200	200	1790	data/words200



Multiple files may be given at once.  In this case the grand total is reported at the end:

    $ python src/tt.py wc data/let3 data/random20 data/words200 data/dup5 
         3       3       6  data/let3
        20      20      51  data/random20
       200     200    1790  data/words200
         8       8      16  data/dup5
       231     231    1863  total



## Handling errors

Your program must use `usage()` to raise an error when too few arguments are given; at a minimum the name of one input file is required.

    $ python src/tt.py wc
    Error: Too few arguments

    tt.py wc FILENAME...
        Print newline, word, and byte counts for each file



The program aborts as soon as a non-existent, invalid or inaccessible file is encountered.  You do not need to pre-screen the arguments before you begin processing; just let `open()` raise an exception.

    $ python src/tt.py wc data/let3 data/random20 data/DOES_NOT_EXIST data/dup5 
    3	3	6	data/let3
    20	20	51	data/random20
    Traceback (most recent call last):
      File "src/tt.py", line 74, in <module>
        ops[sys.argv[1]](sys.argv[2:])
      File "/home/fadein/school/Sp19/cs1440/Assn/1/src/WordCount.py", line 5, in wc
        f = open(file)
    FileNotFoundError: [Errno 2] No such file or directory: 'data/DOES_NOT_EXIST'
