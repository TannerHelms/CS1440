from fractals import FractalInterface
from fractals.Alien import Alien
from fractals.BurningShipJulia import BurningShipJulia
from fractals.Julia import Julia
from fractals.Mandelbrot import Mandelbrot


def makeFractal(nameOfFractal: str, iterations) -> FractalInterface:
    if nameOfFractal == "mandelbrot":
        return Mandelbrot(iterations)
    if nameOfFractal == "julia":
        return Julia(iterations)
    if nameOfFractal == "burningshipjulia":
        return BurningShipJulia(iterations)
    if nameOfFractal == "alien":
        return Alien(iterations)
    raise
