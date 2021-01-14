"""
Given a coordinate in the complex plane, return the iteration
    count of the Julia function for that point
"""
from fractals.FractalInterface import FractalInterface


class BurningShipJulia(FractalInterface):
    def __init__(self, iterations: int):
        super().__init__(iterations)
        self.iterations = iterations

    def count(self, c):
        super().count(c)
        z = complex(-1.0, 0.0)
        n = 0

        while abs(z) <= 2 and n < self.iterations:
            z = complex(abs(z), abs(z)) * complex(abs(z), abs(z)) - c
            n += 1
        return n
