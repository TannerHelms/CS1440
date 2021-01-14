import sys

from Gradient.Default import Default
from Gradient.Gold import Gold
from Gradient.GradientInterface import GradientInterface
from Gradient.BlackWhite import BlackWhite
from Gradient.Random import Random
from Gradient.USA import USA


def makeGradient() -> GradientInterface:
    if len(sys.argv) == 3:
        if sys.argv[2] == "BlackWhite":
            return BlackWhite()
        if sys.argv[2] == "USA":
            return USA()
        if sys.argv[2] == "Random":
            return Random()
        if sys.argv[2] == "Gold":
            return Gold()
        raise NotImplementedError("Invalid gradient requested")
        pass
    print("GradientFactory: Creating default gradient")
    return Default()
