"""
FractalSelection uses the command line arguments to select which fractal
image to use
"""
import os

import sys


# Process command-line arguments, allowing the user to select their fractal
def getImageFromUserInput():
    # Check to see if the user provided a fractal
    if not len(sys.argv) < 2:
        userInput = sys.argv[1]

    # Create default values
    else:
        print("FractalFactory: Creating default fractal")
        userInput = "data/leaf.frac"

    # Create an array that will hold all the fractal info
    f = open(userInput, 'r')
    fractalArray = {}
    for string in f.readlines():
        string = string.replace("\n", "").lower()
        if "type" in string:
            fractalArray["type"] = string.replace("type:", "").replace(" ", "")
        if "pixels" in string:
            fractalArray["pixels"] = int(string.replace("pixels:", "").replace(" ", ""))
        if "centerx" in string:
            fractalArray["centerX"] = float(string.replace("centerx:", "").replace(" ", ""))
        if "centery" in string:
            fractalArray["centerY"] = float(string.replace("centery:", "").replace(" ", ""))
        if "axislength" in string:
            fractalArray["axisLength"] = float(string.replace("axislength:", "").replace(" ", ""))
        if "iterations" in string:
            fractalArray["iterations"] = int(string.replace("iterations:", "").replace(" ", ""))
    fractalArray["nameOfFile"] = userInput
    return fractalArray
