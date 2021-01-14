from abc import ABC, abstractmethod


class GradientInterface(ABC):
    @abstractmethod
    def __init__(self):
        pass

    @abstractmethod
    def getColor(self, n) -> str:
        pass

    @abstractmethod
    def getSize(self) -> int:
        pass
