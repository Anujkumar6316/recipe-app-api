"""
Sample test
"""

from django.test import SimpleTestCase
from app import calc


class CalcTests(SimpleTestCase):
    def test_add(self):
        res = calc.add(6, 4)
        self.assertTrue(10, res)

    def test_subtract(self):
        res = calc.subtract(10, 15)
        self.assertTrue(res, 5)
