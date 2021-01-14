import sys

from gradients.Gold import Gold
from gradients.GradientInterface import GradientInterface
from gradients.Rainbow import Rainbow
from gradients.USA import USA
from gradients.Random import Random


def makeGradient(iterations) -> GradientInterface:
    if len(sys.argv) == 3:
        argument = sys.argv[2]
        if argument == "USA":
            return USA(iterations)
        if argument == "Gold":
            return Gold(iterations)
        if argument == "Rainbow":
            return Rainbow(iterations)
        if argument == "Random":
            return Random(iterations)
        raise NotImplementedError("Invalid gradient requested")
    print("GradientFactory: Creating default gradient")
    return Gold(iterations)
