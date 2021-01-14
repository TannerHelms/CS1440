"""
FractalSelection uses the command line arguments to select which fractal
image to use
"""
import os
import re

from Images import juliaImages, mandelbrotImages, Egg
from Gradient.GradientDictionary import Gradients
import sys

juliaDictionary = juliaImages.Images
mandelDictionary = mandelbrotImages.Images
EggDictionary = Egg.Images


# Process command-line arguments, allowing the user to select their fractal
def getImageFromUserInput():

    # Check to see if the user provided a fractal
    if not len(sys.argv) < 2:
        userInput = sys.argv[1]

    # Crash the program since no fractal is provided
    else:
        print("FractalFactory: Creating default fractal")
        print("GradientFactory: Creating default gradient")
        userInput = "../data/leaf.frac"

    # Check if the user input is in the juliaDictionary
    if os.path.exists(userInput):
        f = open(userInput, 'r')
        fractalArray = {}
        for string in f.readlines():
            string = string.replace("\n", "")
            if "type" in string:
                fractalArray["type"] = string.replace("type:", "").replace(" ", "")
            if "pixels" in string:
                fractalArray["pixels"] = float(string.replace("pixels:", "").replace(" ", ""))
            if "centerx" in string:
                fractalArray["centerx"] = float(string.replace("centerx:", "").replace(" ", ""))
            if "centery" in string:
                fractalArray["centery"] = float(string.replace("centery:", "").replace(" ", ""))
            if "axislength" in string:
                fractalArray["axislength"] = float(string.replace("axislength:", "").replace(" ", ""))
            if "iterations" in string:
                fractalArray["iterations"] = int(string.replace("iterations:", "").replace(" ", ""))
        return userInput, fractalArray

    # If we got to this point we have invalid user input
    crashProgram()


# crashProgram crashes the program with instructions
def crashProgram():
    print(f"Usage: main.py FRACTALNAME GRADIENT<optional>\nWhere FRACTALNAME is one of:")
    for f in juliaDictionary:
        print(f"\t{f}")
    for f in mandelDictionary:
        print(f"\t{f}")
    for f in EggDictionary:
        print(f"\t{f}")
    print("Where GRADIENT is one of:")
    for f in Gradients:
        print(f"\t{f}")
    sys.exit(1)
