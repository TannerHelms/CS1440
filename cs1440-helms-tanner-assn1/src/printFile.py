"""print lines of files beginning with a pattern"""
import sys

args = sys.argv
for file in args[1:]:
    f = open(file, newline='')
    for line in f.readlines():
        print(line)
