import unittest
import sys


class TestPythonVersion(unittest.TestCase):
    def test_python_version(self):
        versionNeeded = "3.6.5"
        currentVersion = sys.version.split()[0]
        errorMessage = ("python version needs to be " +
        versionNeeded + ", instead of " + currentVersion)
        self.assertEqual(currentVersion, versionNeeded, errorMessage)


unittest.main()
