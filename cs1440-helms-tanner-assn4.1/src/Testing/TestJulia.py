import unittest
from julia_fractal import getColorFromGradient
from utils.Config import getFractalConfigurationData
from Images.juliaImages import Images


# autocmd BufWritePost <buffer> !python3 runTests.py

class TestJulia(unittest.TestCase):
    def test_colorOfThePixel(self):
        self.assertEqual(getColorFromGradient(complex(0, 0)), '#009cb3')
        self.assertEqual(getColorFromGradient(complex(-0.751, 1.1075)), '#ffe4b5')
        self.assertEqual(getColorFromGradient(complex(-0.2, 1.1075)), '#ffe4b5')
        self.assertEqual(getColorFromGradient(complex(-0.75, 0.1075)), '#009cb3')
        self.assertEqual(getColorFromGradient(complex(-0.748, 0.1075)), '#009cb3')
        self.assertEqual(getColorFromGradient(complex(-0.7562500000000001, 0.078125)), '#009cb3')
        self.assertEqual(getColorFromGradient(complex(-0.7562500000000001, -0.234375)), '#ffeda4')
        self.assertEqual(getColorFromGradient(complex(0.3374999999999999, -0.625)), '#ffe7ae')
        self.assertEqual(getColorFromGradient(complex(-0.6781250000000001, -0.46875)), '#ffe7ae')
        self.assertEqual(getColorFromGradient(complex(0.4937499999999999, -0.234375)), '#fff797')
        self.assertEqual(getColorFromGradient(complex(0.3374999999999999, 0.546875)), '#ffe9ab')

    def test_dictionaryGetter(self):
        self.assertIsNone(getFractalConfigurationData(Images, 'absent'))
        self.assertIsNotNone(getFractalConfigurationData(Images, 'fulljulia'))
        self.assertIsNone(getFractalConfigurationData(Images, ''))
        self.assertIsNotNone(getFractalConfigurationData(Images, 'lakes'))
        self.assertIsNone(getFractalConfigurationData(Images, 'Still Not In Here'))
        self.assertIsNotNone(getFractalConfigurationData(Images, 'hourglass'))


if __name__ == '__main__':
    unittest.main()
