import unittest
import sys


class TestPythonVersion(unittest.TestCase):
    def test_python_version(self):
        need = "3.6.5"
        current = sys.version.split()[0]
        errorMessage = "need " + need + ", instead of " + current
        self.assertEqual(current, need, errorMessage)


unittest.main()
