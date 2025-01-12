from django.test import SimpleTestCase

from app import calc


class CalcTests(SimpleTestCase):

    def test_addition(self):
        res = calc.add(5, 6)
        self.assertEqual(res, 11)

    def test_subtract(self):
        res = calc.subtract(15, 10)
        self.assertEqual(res, 5)
