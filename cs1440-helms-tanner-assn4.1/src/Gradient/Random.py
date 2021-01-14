"""
Contains an array `G` containing `N` colors; when the
    Mandelbrot or Julia fractal function returns an iteration count of a point
    in the complex plane, the corresponding pixel is painted `G[count]`
"""
import random

from Gradient.GradientInterface import GradientInterface


class Random(GradientInterface):
    Gradient = []

    def getSize(self) -> int:
        return len(self.Gradient) - 1
        pass

    def __init__(self):
        super().__init__()
        for i in range(0, 81):
            color = "%06x" % random.randint(0, 0xFFFFFF)
            self.Gradient.append("#" + color)
        pass

    def getColor(self, n) -> str:
        super().getColor(n)
        return self.Gradient[n]
        pass
