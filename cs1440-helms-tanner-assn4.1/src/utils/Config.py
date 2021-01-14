"""
Make sure that the fractal configuration data repository dictionary
contains a key by the name of 'name'

When the key 'name' is present in the fractal configuration data repository
dictionary, return its value.

Return False otherwise
"""


def getFractalConfigurationData(dictionary, name):
    for key in dictionary:
        if key in dictionary:
            if key == name:
                return key
            return False
