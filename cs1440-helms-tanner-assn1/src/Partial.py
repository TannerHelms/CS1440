import os
import sys

readFiles = []

# The head tool prints the first lines of files.  When the file is less
# than or equal to 10 lines long head is the same as cat


def head(args):
    numberOfItems = 9
    if args[0] == "-n":
        numberOfItems = int(args[1]) - 1
        args = args[2:]
    OpenFiles(args)
    for file in readFiles:
        if len(readFiles) > 1:
            print("==> " + file.name + " <==")
        index = 0
        for line in file.readlines():
            if index <= numberOfItems:
                print(line, end='')
                index += 1

# tail, by contrast, prints the final 10 (or N) lines of a file.
# When the file is less than or equal to 10 lines long tail is the same as cat


def tail(args):
    numberOfItems = 9
    if args[0] == "-n":
        numberOfItems = int(args[1]) - 1
        args = args[2:]
    OpenFiles(args)
    for file in readFiles:
        if len(readFiles) > 1:
            print("==> " + file.name + " <==")
        line = file.readlines()
        line = line[len(line) - numberOfItems - 1:]
        for line in line:
            print(line, end='')


# OpenFiles, opens the files that are needed for this tool


def OpenFiles(files):
    for f in files:
        # Check to see if we can access the file
        if os.access(f, os.R_OK):
            readFiles.append(open(f))
            continue
        # Return an error if we arnt able to access the file and exit
        print("Invalid file path")
        sys.exit(1)
