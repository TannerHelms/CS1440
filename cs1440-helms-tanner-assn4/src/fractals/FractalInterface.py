from abc import ABC, abstractmethod


class FractalInterface(ABC):
    @abstractmethod
    def __init__(self, iterations: int):
        pass

    @abstractmethod
    def count(self, c):
        pass
