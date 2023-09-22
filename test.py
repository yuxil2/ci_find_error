import unittest
from run import output_positive

class TestOutputPositive(unittest.TestCase):
    def test_output_positive(self):
        self.assertGreater(output_positive(), 0)

if __name__ == '__main__':
    unittest.main()
