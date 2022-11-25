import pytest
from src.examply import add_one, minus_one

def test_empty():
    """
    PyTest tests are callables whose names start with "test"
    (by default)
    It looks for them in modules whose name starts with "test_" or ends with "_test"
    (by default)
    """
    pass


def test_add_one():
    assert add_one(1) == 2

def test_minus_one():
    assert minus_one(2) == 1