import os
import sys


def concatenate(file):
    '''
    Prints the contents of a text file line by line, from the beginning. Similar to the `cat` command in the shell. File is an opened file wit h write permissions. This tool does *not* close a file when it is finished.
    '''
    file.seek(0)
    return file.read()


def printContentsOfFile(fileName):
    f = open(fileName)
    print(concatenate(f))
    f.close()
    pass


if __name__ == '__main__':
    # `os.getcwd()` returns the (C)urrent (W)orking (D)irectory as a string.
    # Synonymous to `pwd` in the shell
    cwd = os.getcwd()
    print(f"Please enter a file path relative to {cwd}")
    fileName = input("File Path: ")
    printContentsOfFile(fileName)
