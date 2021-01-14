"""
Given a coordinate in the complex plane, return the iteration
    count of the Julia function for that point
"""
from fractals.FractalInterface import FractalInterface


class Julia(FractalInterface):

    def __init__(self, iterations):
        super().__init__(iterations)
        self.iterations = iterations
        pass

    def count(self, c) -> int:
        super().count(c)
        """Return the color of the current pixel within the Julia set"""

        z = complex(-1.0, 0.0)

        for i in range(self.iterations):
            c = c * c + z  # Get z1, z2, ...
            if abs(c) > 2:
                return i  # The sequence is unbounded
        return self.iterations - 1  # Indicate a bounded sequence
        pass
