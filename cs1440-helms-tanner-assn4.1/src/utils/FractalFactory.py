from fractals.FractalInterface import FractalInterface
from fractals.Julia import Julia
from fractals.Mandelbrot import Mandelbrot
from fractals.Egg import Egg


def makeFractal(fractalType, iterations) -> FractalInterface:
    if fractalType == "julia":
        return Julia(iterations)
    elif fractalType == "mandelbrot":
        return Mandelbrot(iterations)
    elif fractalType == "Egg":
        return Egg(iterations)
