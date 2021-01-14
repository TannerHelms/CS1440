# Tests the Deck Class

import unittest
from dataclasses import dataclass
import Deck

if __name__ == '__main__':
    unittest.main()


class TestDeck(unittest.TestCase):
    def test_deck(self):
        @dataclass
        class TestCase:
            cardSize: int
            deckSize: int
            maxValue: int

        testcases = [
            TestCase(
                cardSize=5,
                deckSize=5,
                maxValue=25
            ),
            TestCase(
                cardSize=20,
                deckSize=50,
                maxValue=800
            ),
        ]

        for case in testcases:
            print(f"Testing case where cardSize = {case.cardSize}:", end='')
            deck = Deck.Deck(case.cardSize, case.deckSize, case.maxValue)
            self.assertEqual(case.deckSize, deck.getCardCount())
            for i in range(1, case.deckSize):
                self.assertIsNotNone(deck.getCard(i))
            print(" Pass")


class TestDeck2(unittest.TestCase):
    def setUp(self):
        self.deck = Deck.Deck(7, 3, 100)
        self.deck1 = Deck.Deck(0, 0, 0)

    def test_getCardCount(self):
        self.assertNotEqual(self.deck.getCardCount(), 0)
        self.assertEqual(self.deck.getCardCount(), 3)
        self.assertEqual(self.deck1.getCardCount(), 0)

    def test_getCard(self):
        self.assertIsNotNone(self.deck.getCard(1))
        self.assertIsNone(self.deck.getCard(0))
        self.assertIsNone(self.deck1.getCard(1))

        # This requires the students to name their card array __m_cards.
        # .. It also accesses a private member which may not be preferred.
        self.assertIs(self.deck.getDeck()[1], self.deck.getCard(1))
        self.assertIs(self.deck.getDeck()[2], self.deck.getCard(2))
        self.assertIs(self.deck.getDeck()[3], self.deck.getCard(3))
        self.assertIsNot(self.deck.getDeck()[1], self.deck.getCard(2))
        self.assertIsNot(self.deck.getDeck()[2], self.deck.getCard(3))
        self.assertIsNot(self.deck.getDeck()[3], self.deck.getCard(1))
