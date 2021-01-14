# CS 1440 Assignment 2 Hints

## Cite external sources in your repository's `README.md`.

While you may discuss aspects of your program's high-level design with your
study buddies, you must write your code independently.


## Look for analogies

*   This program operates a bit like the `grep` text tool.  `grep` scans
    through a file line-by-line and only outputs lines that contain a pattern.
    This program will scan through a file line-by-line and only operate on
    lines that match certain criteria.
*   This program shares with the `cut` text tool the feature that it splits
    lines of text into lists using commas as delimiters.
*   This isn't a sly hint that you should copy & paste code from the previous
    assignment or import those modules into this program.  The similarities
    between this program and the last are not that great.  Rather, use the Text
    Tools program as an *inspiration*.


## Debugging

* Interactive debugging is difficult when your main loop executes ~3 million
  times.  Debug your program with smaller input files that are easier to
  understand.
* Print-statement and Wolf Fence debugging are good approaches when faced with
  mammoth data.
* If you want to add extra calls to `print()` for your own debugging purposes
  but not have it affect the grading system, be sure to send the output to
  standard error (`sys.stderr`).  You can see how to do this in `src/main.py`.


## Files and paths

*   Don't use backslashes `\` as directory separators; they don't work properly
    on all systems or in all situations.  Use the frontslash `/` instead.
*   Your program must work regardless of its current working directory (CWD.
*   Your program must be able to work with *any* directory name that can be
    supplied on the command line, even directories not included with the
    starter code.


## area_titles.csv

*   Read this file line-by-line. As you read it:
    *   Discard unwanted FIPS areas.
    *   Collect this data into a Python dictionary mapping FIPS codes to area
        titles.
*   FIPS area codes follow a simple pattern which makes it easy to exclude the
    national aggregate, statewide aggregate metropolitan and micropolitan
    areas.
*   While some FIPS area codes look like integers, it is best to always regard
    them as strings.
*   `area_titles.csv` contains 4,726 lines of text, of which the first is a CSV
    header line.  After discarding unwanted FIPS areas you will be left with
    3,463 FIPS areas.
*   Read the `help()` documentation for `str.split` to learn how to split each
    line of `area_titles.csv` into exactly two fields regardless of the number
    of commas it contains.
*   FIPS area codes follow a pattern.  You can easily identify FIPS areas that
    must be excluded from consideration solely by looking at the FIPS code.  If
    you consider the human-friendly area title, you're working too hard.


## 2019.annual.singlefile.csv

*   Read this file line-by-line. As you read it:
    *   Discard lines from FIPS areas which do not belong in the report.
    *   Discard lines from industries which do not belong in the report.
*   The layout of this CSV file is described by
    [this document](https://data.bls.gov/cew/doc/layouts/csv_annual_layout.htm).
    Bear in mind as you read this document that we are using the **singlefile**.
*   Keep track of the data required for the report.  You must accumulate totals
    keep maximum values across three categories *and* keep track of the
    highest-ranked FIPS area.
*   This is a very big file and your program will take a long time to read it
    (my implimentation takes ~6.5 seconds to read the file once on my laptop).
    Minimize the number of times your program reads the file.  One pass is
    enough.
*   Make sure that you have a program that *works* before you worry about
    having a program that is *fast*.

> Programmers waste enormous amounts of time thinking about, or worrying about,
> the speed of noncritical parts of their programs, and these attempts at
> efficiency actually have a strong negative impact when debugging and
> maintenance are considered. We should forget about small efficiencies, say
> about 97% of the time: premature optimization is the root of all evil. Yet we
> should not pass up our opportunities in that critical 3%.
> 
> – Donald Knuth
> "Structured Programming With Go To Statements"
> Computing Surveys, Vol 6, No 4, December 1974
