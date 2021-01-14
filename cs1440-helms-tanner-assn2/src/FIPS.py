class FIPS:
    def __init__(self, f):
        self.fips = {}
        f.readline()
        for line in f.readlines():
            if verifyFIPS(line[9:-2]) and not line[1:6].__contains__("000"):
                self.fips[line[1:6]] = line[9:-2]

    def checkFips(self, Fips: str):
        if self.fips.__contains__(Fips):
            return self.fips[Fips]
        return ""


def verifyFIPS(location) -> bool:
    if "U.S. Combined" in location or "Statewide" in location or \
            "statewide" in location or "TOTAL" in location or \
            "MicroSAs" in location or "MSAs" in location or \
            "CSAs" in location or "Federal Bureau of Investigation – undesignated" in location or \
            "Metropolitan" in location or "-" in location or "Nonmetropolitan" in location:
        return False
    return True
