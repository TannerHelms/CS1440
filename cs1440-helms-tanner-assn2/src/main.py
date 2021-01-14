import time
import sys
from Report import Report
from Calculate import Calculate
'''
Your task is to analyze a large body of data and produce a report of the
findings.  This program summarizes national employment data collected by the
U.S. Bureau of Labor Statistics in 2019.  The report consists of two sections,
a summary across all industries and a summary across the software publishing
industry.  I worked with the customer far enough to develop the format of the
report.  It is your task to analyze a 489MB CSV file to pull out the data
needed by the report.

The flow of the code for the program is as follows:
    * Use the command line arguments to get a directory from the user that
      we are going to use for the calculations
    * Using our Calculate class and the Statistics class, calculate the
      statistics for the given directory
    * Print out the time it took for the program to execute all this
    * Print out the statistics using the Statistics class created by 
      the Calculate class
'''
if __name__ == '__main__':
    rpt = Report()
    # Check that we have enough arguments from the user
    if len(sys.argv) < 2:
        print("Usage: src/main.py DATA_DIRECTORY")
        sys.exit(1)

    print("Reading the databases...", file=sys.stderr)
    before = time.time()
    # Get the file paths that will be needed for the statistics
    areaTitles = sys.argv[1] + "/area_titles.csv"
    annualSingleFile = sys.argv[1] + "/2019.annual.singlefile.csv"
    # Using the provided files, Calculate the statistics
    stats = Calculate(annualSingleFile, areaTitles)
    # Get the statistics from the Statistics class
    statsOverAllIndustries, statsOverSoftwareIndustries = stats.getStats()
    # Calculate the time it took to do the calculations
    after = time.time()
    print(f"Done in {after - before:.3f} seconds!", file=sys.stderr)
    # ------------------------ All Industries Statistics -------------
    # Number of FIPS for All Industries
    rpt.all.num_areas = statsOverAllIndustries.GetFips()
    # Annual Wages Stats
    rpt.all.total_annual_wages = statsOverAllIndustries.GetTotalAnnualWages()
    rpt.all.max_annual_wage = (statsOverAllIndustries.GetAreaWithMaximumAnnualWages()
                               , statsOverAllIndustries.GetMaximumReportedWage())
    # Establishments Stats
    rpt.all.total_estab = statsOverAllIndustries.GetTotalNumberOfEstablishments()
    rpt.all.max_estab = (statsOverAllIndustries.GetAreaWithMostEstablishments()
                         , statsOverAllIndustries.GetMaximumNumberOfEstablishments())
    # Employment Stats
    rpt.all.total_empl = statsOverAllIndustries.GetTotalAnnualEmploymentLevel()
    rpt.all.max_empl = (statsOverAllIndustries.GetAreaWithMaximumEmployment()
                        , statsOverAllIndustries.GetMaximumReportedEmploymentLevel())
    # ------------------------ Software Industries Stats ---------------
    # Number of FIPS that are included in the report
    rpt.soft.num_areas = statsOverSoftwareIndustries.GetFips()
    # Total Wages Stats
    rpt.soft.total_annual_wages = statsOverSoftwareIndustries.GetTotalAnnualWages()
    rpt.soft.max_annual_wage = (statsOverSoftwareIndustries.GetAreaWithMaximumAnnualWages()
                                , statsOverSoftwareIndustries.GetMaximumReportedWage())
    # Total Establishment Stats
    rpt.soft.total_estab = statsOverSoftwareIndustries.GetTotalNumberOfEstablishments()
    rpt.soft.max_estab = (statsOverSoftwareIndustries.GetAreaWithMostEstablishments()
                          , statsOverSoftwareIndustries.GetMaximumNumberOfEstablishments())
    # Total Employment Stats
    rpt.soft.total_empl = statsOverSoftwareIndustries.GetTotalAnnualEmploymentLevel()
    rpt.soft.max_empl = (statsOverSoftwareIndustries.GetAreaWithMaximumEmployment()
                         , statsOverSoftwareIndustries.GetMaximumReportedEmploymentLevel())

    # Print the completed report
    print(rpt)
