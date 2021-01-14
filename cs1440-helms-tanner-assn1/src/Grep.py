import os
import sys


def grep(args):
    notContains = False
    if args[0] == "-v":
        notContains = True
        args = args[1:]
    containsString = args[0]
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
            if notContains:
                if line.__contains__(containsString):
                    continue
                print(line, end='')
            elif line.__contains__(containsString):
                print(line, end='')


