#!/usr/bin/env python

from Concatenate import cat, tac
from CutPaste import cut, paste
from Grep import grep
from Partial import head, tail
from Sorting import sort
from WordCount import wc
from Usage import usage

import sys
if len(sys.argv) < 2:
    usage()
    sys.exit(1)
else:
    tool = sys.argv[1]
    funcArguments = sys.argv[2:4]
    if len(funcArguments) == 0:
        usage("Too few arguments", tool)
        sys.exit(1)
    if tool == "cat":
        cat(funcArguments)
    if tool == "tac":
        tac(funcArguments)
    if tool == "paste":
        paste(funcArguments)
    if tool == "cut":
        if len(funcArguments) == 1:
            if funcArguments[0] == "-f":
                usage("A comma-separated field specification is required", tool)
                sys.exit(1)
            arr = ["1", funcArguments[0]]
            cut(arr)
        else:
            cut(funcArguments[1:])
    if tool == "grep":
        if funcArguments[0] == "-v":
            if len(funcArguments) < 3:
                usage("Too few arguments", tool)
                sys.exit(1)
        if len(funcArguments) == 1:
            usage("Too few arguemnts", tool)
            sys.exit(1)
        grep(funcArguments)
    if tool == "startgrep":
        startgrep(funcArguments)
    if tool == "head":
        if funcArguments[0] == "-n":
            if len(funcArguments) < 3:
                usage("Number of lines is required", tool)
                sys.exit(1)
            for c in funcArguments[1]:
                if 0 <= int(c) <= 9:
                    continue
                else:
                    usage("Number of lines is required", tool)
                    sys.exit(1)
        head(funcArguments)
    if tool == "tail":
        if funcArguments[0] == "-n":
            if len(funcArguments) < 3:
                usage("Number of lines is required", tool)
                sys.exit(1)
            for c in funcArguments[1]:
                if 0 <= int(c) <= 9:
                    continue
                else:
                    usage("Number of lines is required", tool)
                    sys.exit(1)
        tail(funcArguments)
    if tool == "sort":
        sort(funcArguments)
    if tool == "wc":
        wc(funcArguments)
