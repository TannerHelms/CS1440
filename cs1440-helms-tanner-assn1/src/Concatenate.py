import os
import sys

fileContents = []


# cat concatenates two files into one


def cat(args):
    OpenFiles(args)
    for i in fileContents:
        print(i)


# tac works just like cat, only backwards


def tac(args):
    msg = ""
    for file in args:
        if os.access(file, os.R_OK):
            f = open(file)
            fileLines = f.readlines()
            fileLines.reverse()
            for line in fileLines:
                msg += line
            f.close()
            continue
        print("Invalid file path")
        sys.exit(1)
    print(msg)


# OpenFiles, opens the files that are needed for this tool


def OpenFiles(files):
    for f in files:
        # Check to see if we can access the file
        if os.access(f, os.R_OK):
            f = open(f)
            for line in f.readlines():
                fileContents.append(line.replace("\n", ""))
            f.close()
            continue
        # Return an error if we arnt able to access the file and exit
        print("Invalid file path")
        sys.exit(1)
