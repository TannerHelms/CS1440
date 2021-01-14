import os
import sys

msg = []

'''
The sort tool does the following...
    * Opens the files
    * Combines the contents of the files into an array split by "\n0"
    * Sorts the array
    * Prints the array
'''


def sort(args):
    OpenFiles(args)
    msg.sort()
    for line in msg:
        print(line)


# OpenFiles, opens the files that are needed for this tool


def OpenFiles(files):
    for f in files:
        # Check to see if we can access the file
        if os.access(f, os.R_OK):
            txt = open(f).read().split("\n")
            for t in txt:
                msg.append(t)
            continue
        # Return an error if we arnt able to access the file and exit
        print("Invalid file path")
        sys.exit(1)
