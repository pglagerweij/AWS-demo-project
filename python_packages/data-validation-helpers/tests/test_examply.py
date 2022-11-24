import pytest
from src.examply import add_one

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