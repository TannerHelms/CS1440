import os
# from ex1 import getFileSafely
import sys


def printContents1(file):
    content = file.read()
    print(content, end="")
    pass


def printContents2(file):
    for line in file.readlines():
        print(line, end="")
    pass


def printTwice(filename):
    if os.access(filename, os.R_OK):
        f = open(filename)
        printContents1(f)
        f.seek(0)
        printContents2(f)
        f.close()
        return
    sys.exit(1)
    pass


if __name__ == '__main__':
    cwd = os.getcwd()
    print(f"Please enter a file path relative to {cwd}")
    filename = input("File Path: ")
    printTwice(filename)
