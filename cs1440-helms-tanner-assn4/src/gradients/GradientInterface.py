from abc import ABC, abstractmethod


class GradientInterface(ABC):
    @abstractmethod
    def __init__(self, iterations):
        pass

    @abstractmethod
    def getColor(self, n) -> str:
        pass
