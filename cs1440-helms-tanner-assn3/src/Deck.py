import sys

import Card
import NumberSet


class Deck:
    def __init__(self, cardSize, deckSize, maxValue):
        self.__cardSize = cardSize
        self.__deckSize = deckSize
        self.__maxValue = maxValue
        self.__deck = {}
        self.__numberSet = NumberSet.NumberSet(self.__cardSize, self.__maxValue)
        self.populateDeck()
        pass

    def getDeck(self):
        return self.__deck

    def populateDeck(self):
        for i in range(1, self.__deckSize + 1):
            self.__deck[i] = Card.Card(i, self.__cardSize, self.__numberSet.GetValues().copy())

    def getCardCount(self):
        return self.__deckSize
        pass

    def getCard(self, cardId) -> Card.Card:
        return self.__deck.get(cardId)

    def print(self, file=sys.stdout, idx=None):
        if idx is None:
            for idx in range(1, self.__deckSize + 1):
                c = self.getCard(idx)
                c.print(file)
                print()
            print('', file=file)
        else:
            self.getCard(idx).print(file)
