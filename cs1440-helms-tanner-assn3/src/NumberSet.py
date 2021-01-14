from random import shuffle
from random import randint


class NumberSet:
    def __init__(self, size, maxValue):
        self.__size = size
        self.__maxValue = maxValue
        self.__numberSet = []
        self.__index = 0
        self.populate()
        pass

    def timeoutPopulate(self):
        while len(self.__numberSet) <= self.__size ** 2:
            self.__numberSet.append(randint(0, self.__maxValue))

    def populate(self):
        tempVar = self.__size ** 2 - self.__maxValue
        if tempVar < 1:
            tempVar = 0

        for _ in range(0, self.__size ** 2 - tempVar):
            ranNum = randint(0, self.__maxValue)
            while self.__numberSet.__contains__(ranNum):
                ranNum = randint(0, self.__maxValue)
            self.__numberSet.append(ranNum)

        if len(self.__numberSet) < self.__size ** 2:
            print(f"This Bingo Set will contain duplicate numbers as the\n"
                  f"card size is {self.__size} ({self.__size ** 2} numbers total) and the max\n"
                  f"value is {self.__maxValue}")

        while len(self.__numberSet) < self.__size ** 2:
            self.__numberSet.append(randint(0, self.__maxValue))

        if self.__size % 2 == 1:
            self.__numberSet[round(self.__size ** 2 / 2)] = "FREE"

    def getSize(self):
        return self.__size
        pass

    def get(self, index):
        return self.__numberSet[index]
        pass

    def randomize(self):
        shuffle(self.__numberSet)
        pass

    def getNext(self):
        return self.__numberSet[self.__index]
        pass

    def GetValues(self):
        if self.__numberSet.__contains__("FREE"):
            idx = round(self.__size ** 2 / 2)
            self.__numberSet.remove("FREE")
            self.randomize()
            self.__numberSet.insert(idx, "FREE")
        else:
            self.randomize()
        return self.__numberSet
