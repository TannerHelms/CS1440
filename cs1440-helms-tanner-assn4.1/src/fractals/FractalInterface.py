from abc import ABC, abstractmethod


class FractalInterface(ABC):
    @abstractmethod
    def __init__(self, iterations):
        pass

    @abstractmethod
    def count(self, c) -> int:
        pass

