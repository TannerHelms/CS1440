"""
Given a coordinate in the complex plane, return the
    iteration count of the Mandelbrot function for that point
"""
from fractals.FractalInterface import FractalInterface


class Mandelbrot(FractalInterface):
    def __init__(self, iterations):
        super().__init__(iterations)
        self.iterations = iterations

    def count(self, c):
        super().count(c)
        z = 0
        n = 0

        while abs(z) <= 2 and n < self.iterations:
            z = z * z + c
            n += 1
        return n
