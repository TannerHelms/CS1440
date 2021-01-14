# Tests the NumberSet Class

import unittest
import NumberSet
from dataclasses import dataclass


def checkForValidNumbers(actual: [], size: int, maxValue: int) -> bool:
    if not len(actual) == size ** 2:
        return False
    if size % 2 == 1:
        if not actual[round(size ** 2 / 2)] == "FREE":
            return False
    for i in actual:
        if i == "FREE":
            continue
        if int(i) > maxValue:
            return False
    return True


if __name__ == '__main__':
    unittest.main()


class TestNumberSet(unittest.TestCase):
    def test_number_set(self):
        @dataclass
        class TestCase:
            name: str
            size: int
            maxValue: int

        testcases = [
            TestCase(
                name="1",
                size=5,
                maxValue=25,
            ),
            TestCase(
                name="2",
                size=1,
                maxValue=50,
            ),
            TestCase(
                name="3",
                size=10,
                maxValue=200,
            ),
            TestCase(
                name="4",
                size=10,
                maxValue=100,
            )
        ]

        for case in testcases:
            print(f"Testing case {case.name}:", end='')
            actual = NumberSet.NumberSet(case.size, case.maxValue).GetValues()
            self.assertTrue(
                checkForValidNumbers(actual, case.size, case.maxValue),
                "failed test {} not a valid NumberSet: {}".format(
                    case.name, "", actual
                )
            )
            print(" Pass")
