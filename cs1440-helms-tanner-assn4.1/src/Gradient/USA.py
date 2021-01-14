"""
Contains an array `G` containing `N` colors; when the
    Mandelbrot or Julia fractal function returns an iteration count of a point
    in the complex plane, the corresponding pixel is painted `G[count]`
"""

from Gradient.GradientInterface import GradientInterface


class USA(GradientInterface):
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
        '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
        '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
        '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
        '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF', '#0000FF',
        '#FF0000', '#FF0000', '#FF0000', '#FF0000', '#FF0000', '#FF0000',
        '#FFFFFF', '#FFFFFF', '#FF0000', '#FFFFFF', '#FF0000', '#FFFFFF',
    ]
