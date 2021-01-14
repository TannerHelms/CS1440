"""
Contains an array `G` containing `N` colors; when the
    Mandelbrot or Julia fractal function returns an iteration count of a point
    in the complex plane, the corresponding pixel is painted `G[count]`
"""

from Gradient.GradientInterface import GradientInterface


class Gold(GradientInterface):
    def getSize(self) -> int:
        return len(self.Gradient) - 1
        pass

    def __init__(self):
        super().__init__()
        pass

    def getColor(self, n) -> str:
        super().getColor(n)
        return self.Gradient[n]
        pass

    Gradient = [
        '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00',
        '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00', '#FFFF00',
        '#000000', '#000000', '#000000', '#000000', '#000000', '#000000',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
         '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700', '#FFD700',
        '#000000', '#000000', '#000000', '#000000', '#000000', '#000000',
        '#000000', '#000000', '#000000', '#000000', '#000000', '#000000',
    ]
