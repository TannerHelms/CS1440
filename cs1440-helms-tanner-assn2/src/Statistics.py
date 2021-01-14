"""
The Purpose of Statistics is to store all of
the statistics that are needed for the report.
This class will handle of the the calculations
and just needs numbers for the calculations.
"""
AllIndustries = "allIndustries"
SoftwareIndustries = "softwareIndustries"


def SetType(typeOfStatistics):
    # checkForAllIndustries checks that the given line
    # falls into the Industries requirements which is
    # industry_code is equal to "10" and own_code is equal to "0"
    if typeOfStatistics == AllIndustries:
        def x(line) -> bool:
            data = line.replace("\"", "").split(",")
            if len(data) < 5:
                return False
            if data[1] == "0" and data[2] == "10":
                return True
            return False

        return x

    if typeOfStatistics == SoftwareIndustries:
        # checkForSoftwarePublishingIndustry checks that the given line
        # falls into the Software PublishingIndustry which is
        # industry_code is equal to "5112" and own_code is equal to "5".
        def x(line) -> bool:
            data = line.replace("\"", "").split(",")
            if len(data) < 5:
                return False
            if data[1] == "5" and data[2] == "5112":
                return True
            return False

        return x


class Statistics:
    def __init__(self):
        self.__typeOfStatistics = SetType(AllIndustries)
        self.__FipsInReport = 0
        self.__TotalAnnualWages = 0
        self.__AreaWithMaximumAnnualWages = ""
        self.__MaximumReportedWage = 0
        self.__TotalNumberOfEstablishments = 0
        self.__AreaWithMostEstablishments = ""
        self.__MaximumNumberOfEstablishments = 0
        self.__TotalAnnualEmploymentLevel = 0
        self.__AreaWithMaximumEmployment = ""
        self.__MaximumReportedEmploymentLevel = 0

    def SetSoftwareIndustry(self):
        self.__typeOfStatistics = SetType(SoftwareIndustries)
        return self

    def SetAllIndustries(self):
        self.__typeOfStatistics = SetType(AllIndustries)
        return self

    def CheckForIndustry(self, fips) -> bool:
        if self.__typeOfStatistics(fips):
            return True

    # GetFips returns the amount of FIPS that are
    # included in the statistics

    def GetFips(self):
        return self.__FipsInReport

    def GetTotalAnnualWages(self):
        return self.__TotalAnnualWages

    def GetAreaWithMaximumAnnualWages(self):
        return self.__AreaWithMaximumAnnualWages

    def GetMaximumReportedWage(self):
        return self.__MaximumReportedWage

    def GetTotalNumberOfEstablishments(self):
        return self.__TotalNumberOfEstablishments

    def GetAreaWithMostEstablishments(self):
        return self.__AreaWithMostEstablishments

    def GetMaximumNumberOfEstablishments(self):
        return self.__MaximumNumberOfEstablishments

    def GetTotalAnnualEmploymentLevel(self):
        return self.__TotalAnnualEmploymentLevel

    def GetAreaWithMaximumEmployment(self):
        return self.__AreaWithMaximumEmployment

    def GetMaximumReportedEmploymentLevel(self):
        return self.__MaximumReportedEmploymentLevel

    # AddFipsToReport increments the amount of
    # FIPS in the report

    def AddFipsToReport(self):
        self.__FipsInReport += 1

    def AddTotalWages(self, wage):
        self.__TotalAnnualWages += wage

    # CompareMaximumWages compares all of the
    # Areas to find which one has the highest
    # amount of wages

    def CompareMaximumWages(self, name, value):
        if value > self.__MaximumReportedWage:
            self.__MaximumReportedWage = value
            self.__AreaWithMaximumAnnualWages = name

    def AddNumberOfEstablishments(self, value):
        self.__TotalNumberOfEstablishments += value

    # CompareAreaWithMostEstablishments compares all
    # of the Establishments to find which one has
    # the highest amount of wages

    def CompareAreaWithMostEstablishments(self, name, value):
        if value > self.__MaximumNumberOfEstablishments:
            self.__MaximumNumberOfEstablishments = value
            self.__AreaWithMostEstablishments = name

    def AddTotalEmploymentLevel(self, value):
        self.__TotalAnnualEmploymentLevel += value

    # CompareMaximumEmployment compares the amounts of
    # Employees to see which area has the highest

    def CompareMaximumEmployment(self, name, value):
        if value > self.__MaximumReportedEmploymentLevel:
            self.__MaximumReportedEmploymentLevel = value
            self.__AreaWithMaximumEmployment = name
