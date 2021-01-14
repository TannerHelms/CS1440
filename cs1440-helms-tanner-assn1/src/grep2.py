"""print lines of files beginning with a pattern"""
import sys

args = sys.argv
pattern = args[1]
print(pattern)
for file in args[2:]:
    f = open(file)
    for line in f.readlines():
        if line.__contains__(pattern):
            print(line, end='')
