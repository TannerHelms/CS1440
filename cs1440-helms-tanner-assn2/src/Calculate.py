from Statistics import Statistics
from FIPS import FIPS

statistics = [Statistics().SetAllIndustries(),
              Statistics().SetSoftwareIndustry()]


"""
The Purpose of Calculate is to go through the 
2019.annual.singlefile.csv and validate which 
FIPS areas are valid. Then Calculate forms a
report using the Statistics class. The flow of 
code looks like this:
    * Open 2019.annual.singlefile.csv
    * Open area_titles.csv
    * Go through the file 2019.annual.singlefile.csv
      line by line
    * Validate that the line is valid using verifyFIPS()
    * Check if the area falls into the All Industries 
      and/or Software Industries
    * Using the respective class that either represents
      All Industries or Software Industries, calculate
      the statistics for the line
    * Once all lines have been scanned and calculated,
      close the files
"""


class Calculate:
    # Create a method that will be able to return the statistics back to the user
    @staticmethod
    def getStats():
        return statistics[0], statistics[1]

    def __init__(self, singleFile, areaTitles):
        StatsFile = open(singleFile)
        AreaFile = open(areaTitles)

        fips = FIPS(AreaFile)

        # Scan through each line in the
        # 2019.annual.singlefile.csv file
        for line in StatsFile.readlines():
            # verify that the FIPS is valid for that line
            checkLocation = fips.checkFips(line[1:6])
            if checkLocation != "":
                # All Industries - Industry_code is equal
                # to "10" and own_code is equal to "0"
                for statsObj in statistics:
                    if statsObj.CheckForIndustry(line):
                        data = line.replace("\"", "").split(",")
                        # Total FIPS in report
                        statsObj.AddFipsToReport()
                        # Wages
                        statsObj.AddTotalWages(int(data[10]))
                        statsObj.CompareMaximumWages(checkLocation, int(data[10]))
                        # Establishments
                        statsObj.AddNumberOfEstablishments(int(data[8]))
                        statsObj.CompareAreaWithMostEstablishments(checkLocation, int(data[8]))
                        # Employment Level
                        statsObj.AddTotalEmploymentLevel(int(data[9]))
                        statsObj.CompareMaximumEmployment(checkLocation, int(data[9]))
        # Close the files
        StatsFile.close()
        AreaFile.close()
