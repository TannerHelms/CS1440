import os
import sys

# cut cut, in contrast to paste, extracts fields (or columns) of
# data from a single CSV file given as an argument.  By default
# the 1st column is extracted


def cut(args):
    column = str(args[0])
    columns = column.split(",")
    columns.sort()
    files = []
    for file in args[1:]:
        if os.access(file, os.R_OK):
            f = open(file)
            files.append(f.readlines())
            continue
        print("Invalid file path")
        sys.exit(1)
    for file in files:
        for line in file:
            words = line.split(",")
            for col in columns:
                if int(col) - 1 < len(words):
                    print(words[int(col) - 1].replace("\n", ""), end='')
                    if col == columns[-1]:
                        break
                    print(",", end='')
            print()

# Paste joins two or more files together, inserting a comma in between


def paste(args):
    files = []
    for file in args:
        if os.access(file, os.R_OK):
            f = open(file)
            files.append(f.readlines())
            continue
        print("Invalid file path")
        sys.exit(1)
    longestFile = findLongestFile(files)
    for lineNumber in range(0, longestFile):
        for fileLines in files:
            if lineNumber < len(fileLines):
                print(fileLines[lineNumber].replace("\n", ""), end='')
            if files[len(files) - 1] == fileLines:
                continue
            print(",", end='')
        print()


def findLongestFile(files):
    length = 0
    for file in files:
        if len(file) > length:
            length = len(file)
    return length

