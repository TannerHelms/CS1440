import unittest

from Testing import testCard, testDeck, testMenu, testNumberSet

suite = unittest.TestSuite()

tests = (testCard.TestCard, testDeck.TestDeck, testMenu.TestMenu, testNumberSet.TestNumberSet, testDeck.TestDeck2, testMenu.TestMenu)
for test in tests:
    suite.addTest(unittest.makeSuite(test))

runner = unittest.TextTestRunner(verbosity=2)
runner.run(suite)
