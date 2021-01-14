"""
Given a coordinate in the complex plane, return the
    iteration count of the Mandelbrot function for that point
"""
from fractals.FractalInterface import FractalInterface


class Egg(FractalInterface):

    def __init__(self, iterations):
        super().__init__(iterations)
        self.iterations = iterations

    def count(self, c, iterations) -> int:
        super().count(c)
        MAX_ITER = 80

        z = 0
        n = 0
        while abs(z) <= 2 and n < MAX_ITER:
            z = complex(abs(z), abs(z)) * complex(abs(z), abs(z)) - c
            n += 1
        return n


