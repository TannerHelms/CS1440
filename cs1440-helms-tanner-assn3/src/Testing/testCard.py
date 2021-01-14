import unittest
from dataclasses import dataclass

from Card import Card
from NumberSet import NumberSet


def generateNumberSet(size: int, maxValue: int) -> NumberSet:
    return NumberSet(size, maxValue)


if __name__ == '__main__':
    unittest.main()


class TestCard(unittest.TestCase):
    def test_card(self):
        @dataclass
        class TestCase:
            id: int
            size: int
            maxValue: int
            numberSet: []

        testcases = [
            TestCase(
                id=1,
                size=5,
                maxValue=25,
                numberSet=generateNumberSet(5, 25).GetValues()
            ),
            TestCase(
                id=5,
                size=10,
                maxValue=100,
                numberSet=generateNumberSet(10, 100).GetValues()
            ),
            TestCase(
                id=20,
                size=30,
                maxValue=900,
                numberSet=generateNumberSet(30, 900).GetValues()
            ),

        ]

        for case in testcases:
            print(f"Testing case {case.id}:", end='')
            card = Card(case.id, case.size, case.numberSet)
            self.assertEqual(case.size, card.getSize())
            self.assertEqual(case.id, card.id)
            print(" Pass")
