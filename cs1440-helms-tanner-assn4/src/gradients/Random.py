import random
from gradients.GradientInterface import GradientInterface


class Random(GradientInterface):
    def __init__(self, iterations):
        super().__init__(iterations)
        self.iterations = iterations
        self.Gradient = self.generateRainbow()

    def getColor(self, n) -> str:
        if n > self.getSize():
            return self.Gradient[self.getSize()]
        return self.Gradient[n]
        pass

    def getSize(self) -> int:
        return len(self.Gradient) - 1
        pass

    def generateRainbow(self) -> []:
        gradient = []
        for i in range(0, self.iterations):
            color = "%06x" % random.randint(0, 0xFFFFFF)
            gradient.append("#" + color)
        return gradient

