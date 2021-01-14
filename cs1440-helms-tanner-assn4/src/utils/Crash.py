# crashProgram crashes the program with instructions
import sys
from os import listdir
from os.path import isfile, join


def crashProgram():
    fractalFiles = [f for f in listdir("../data") if isfile(join("../data", f))]

    print(f"Usage: main.py FRACTALNAME\nWhere FRACTALNAME is one of:")
    print("Where FRACTALNAME:")
    for f in fractalFiles:
        print(f)

    print(f"Where GRADIENT:")
    print("Default.py")
    sys.exit(0)
