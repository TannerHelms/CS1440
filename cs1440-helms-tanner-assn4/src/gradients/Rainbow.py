from gradients.GradientInterface import GradientInterface
from gradients.GradientGenerator import setGradient


class Rainbow(GradientInterface):
    def __init__(self, iterations):
        super().__init__(iterations)
        self.Gradient = setGradient(iterations, [
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "indigo",
        ])

    def getColor(self, n) -> str:
        if n > self.getSize():
            return self.Gradient[self.getSize()]
        return self.Gradient[n]
        pass

    def getSize(self) -> int:
        return len(self.Gradient) - 1
        pass

