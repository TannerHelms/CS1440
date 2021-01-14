import sys


def printValue(value: str, file):
    if not file.name == "<stdout>":
        if len(value) == 1:
            print(f"|  {value}  ", end='')
            return
        if len(value) == 2:
            print(f"| {value}  ", end='')
            return
        if value == "FREE!":
            print(f"|{value}", end='')
            return
        print(f"|{value}  ", end='')
        return
    if len(value) == 1:
        print(f"|  {value}  ", end='')
        return
    if len(value) == 2:
        print(f"| {value}  ", end='')
        return
    if value == "FREE!":
        print(f"|{value}", end='')
        return
    print(f"| {value} ", end='')


class Card:
    def __init__(self, idnum, size, numberSet: []):
        self.id = idnum
        self.cardSize = size
        self.numberSet = numberSet
        if self.cardSize % 2 == 1:
            self.numberSet[(round(self.cardSize ** 2 / 2))] = "FREE!"
        pass

    def getId(self):
        return self.id
        pass

    def getSize(self):
        return self.cardSize
        pass

    def print(self, file=sys.stdout):
        if not file.name == "<stdout>":
            sys.stdout = file
            print(f"Card #{self.id}")
            arrIndex = 0
            for i in range(0, self.cardSize):
                self.printHeader()
                printValue(str(self.numberSet[arrIndex]), file)
                arrIndex += 1
                while not arrIndex % self.cardSize == 0 or arrIndex == 0:
                    printValue(str(self.numberSet[arrIndex]), file)
                    arrIndex += 1
                print("|")
            self.printHeader()
            sys.stdout = sys.__stdout__
            return
        print(f"Card #{self.id}")
        arrIndex = 0
        for i in range(0, self.cardSize):
            self.printHeader()
            printValue(str(self.numberSet[arrIndex]), file)
            arrIndex += 1
            while not arrIndex % self.cardSize == 0 or arrIndex == 0:
                printValue(str(self.numberSet[arrIndex]), file)
                arrIndex += 1
            print("|")
        self.printHeader()
        pass

    def printHeader(self):
        for i in range(0, self.cardSize):
            print("+-----", end='')

        print("+")
