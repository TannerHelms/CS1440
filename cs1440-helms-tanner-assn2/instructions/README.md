# CS 1440 Assignment 2 Instructions

## Preparation

The starter code includes a selection of output examples.  The corresponding
data files can be created from the provided instructions by using your Text
Tools.  These data sets are for your use as you test and debug your program.
Reduced data sets that are especially good for interactive debugging are
Washington D.C. and Delaware.  Your submission will be graded by running it
against the full BLS data set for the year 2019, as well as a crafted dataset
that you will not have access to.  To ensure that your program will get full
marks, test it thoroughly by running it against the **full** data set.

The complete CSV file is too big to include in the git repository.  Instead,
download it from this link and unzip it into your repository's `data/USA_full/`
directory.  **Use only the copy of this file provided here!**  Don't download
this file directly from the BLS website as there is a possibility that they
will change its contents without warning, rendering your output different from
the provided examples.

* [2019_annual_singlefile.zip](/uploads/8703b867882ff67788c59129620064f5/2019_annual_singlefile.zip)

Once this file is downloaded, copy it into each of the subdirectories under
`data/` and follow the instructions to create the smaller data sets.  Use the
smaller data sets while you are developing the program, and test against larger
data sets as the project nears completion.


### Don't commit huge files to git!

I have crafted a special `.gitignore` file to prevent the inclusion of huge CSV
files into your git repository.  Don't do anything that defeats these
safeguards!

* Don't rename or remove this `.gitignore` file.
* Do not rename the CSV data file in any way. This includes changing its name
  from lower to upper case, changing punctuation, etc.
* Before you do a `git commit`, first run `git status` and carefully examine
  the list of files to be added.  **STOP** if any CSV file besides
  `area_titles.csv` is about to be committed!


## Requirements

### Command Line Interface

To ensure that the graders are able to run your program, all submissions must
adhere to this command-line interface.

Your program accepts a single mandatory argument: the name of a directory
containing CSV files.

For example, to compute statistics for the complete Washington D.C. data set,
run this command from the repository's top directory:

```
$ python src/main.py data/DC_combined
```

To generate the report against the entire national database, use this command:

```
$ python src/main.py data/USA_full
```

When the data directory argument is omitted a message is printed and the
program exits:

```
$ python src/main.py
Usage: src/main.py DATA_DIRECTORY
```

When the specified directory is non-existent or inaccessible, simply let Python's `open()` function fail:

```
$ python src/main.py data/DERP
Traceback (most recent call last):
  File "src/main.py", line 220, in <module>
    fips = get_fips_areas(sys.argv[1])
  File "src/main.py", line 9, in get_fips_areas
    with open(f'{datadir}/area_titles.csv') as f:
FileNotFoundError: [Errno 2] No such file or directory: 'data/DERP/area_titles.csv'
```

*Important!* Unlike the previous assignment, this program's argument is the
name of a *directory*, not a *file*.  This program is an exception to our
general rule about hard-coding file names into programs.  For this assignment
you *must* hard-code the names of the input files into your program, but *not*
the name of the directory containing them.

Do not make any assumptions about the current directory your program runs from.
It must be able to run from any working directory.


### Running the program and checking your output

This repository contains many sample input directories under the `data/`
directory, each of which contains three files.

*   `README.md`
    -   Instructions for trimming the full data set down using the Text Tools
        from Assignment #1
*   `area_titles.csv`
    -   The database of FIPS area codes
*   `output.txt`
    -   The correct output for this given data set

Unlike other assignments, this program's output must *exactly* match that of
the provided examples down to the smallest detail.  Except for the final
`print(rpt)` line provided in the starter code, your final submission *must
not* write any other data to `sys.stdout`.  The `print()`s which report the
time used to load the CSV files are okay to leave as-is because they write to
the error stream `sys.stderr` instead of `sys.stdout`.

Do not modify `src/Report.py`. Treat it as read-only.  You may create new
modules and classes if needed.


### Processing area_titles.csv

While the file name `area_titles.csv` is hard-coded into your program, the name
of the directory containing it is specified by the user.

This CSV file contains two columns of data, `area_fips` and `area_title`.
These columns map a FIPS area code into a familiar place name.


#### FIPS Codes

A FIPS code is a 5 character alphanumeric code similar to a ZIP code.  A FIPS
area can be a county, an entire state, or a metropolitan area.  There are even
FIPS codes which represent the nation as a whole.  The area designated by a FIPS
area code is much larger than a ZIP code, and one place may be represented by
many overlapping FIPS areas. It is important for the accuracy of the report
that overlapping areas excluded so as to not double-count statistics.

The format of FIPS area codes are described in the [QCEW Area Code
Guide](https://data.bls.gov/cew/doc/titles/area/area_guide.htm).  Part of the
assignment is to read and thoroughly understand this document.


#### How to use the information from `area_titles.csv`

Your program will look at the FIPS area code in each line of this file to
decide whether or not to consider it in your final report.  Your program can
make this determination *solely* from the `area_fips` field; you do not need to
consider the `area_title` to make this decision.

The report should contain data only from counties and county-equivalent
divisions (Louisiana has parishes, Alaska has boroughs and census areas, Puerto
Rico has Municipios).  Your report must include "Overseas Locations";
"Multicounty, Not Statewide"; "Out-of-State"; and "Unknown Or Undefined" areas.
*All of these are easily identified by looking only at their FIPS codes.*

The report must include data from all 50 states, the District of Columbia, and
territories of the United States of America. Your report must not include US
aggregate data, per-state aggregate data, nor should it consider metropolitan
areas. Inclusion of these areas will result in an incorrect report.  *Again, all
of these can be easily identified by the form of their FIPS codes.*


#### Exclude these areas
* "U.S. combined" and "TOTAL" FIPS areas
* All areas labeled "statewide"
* MicroSAs
* MSAs
* CSAs
* Federal Bureau of Investigation – undesignated


#### Do *not* exclude these areas
* Puerto Rico
* Washington, D.C.
* Virgin Islands



### Processing 2019.annual.singlefile.csv

As with the file `area_titles.csv`, the file name `2019.annual.singlefile.csv`
shall be hard-coded into your program while the name of the directory in which
it is found is supplied by the user.

Records in this data set capture various employment statistics such as total
wages paid, the number of people employed and the number of establishments in
each FIPS area for the year 2019.  The layout of this CSV file is described by
[this document](https://data.bls.gov/cew/doc/layouts/csv_annual_layout.htm).
Bear in mind as you read this document that we are working with the
**singlefile**.

The fields in this CSV file containing data for our report are:

*   `total_annual_wages`
*   `annual_avg_emplvl`
*   `annual_avg_estabs`

Not all rows in this file contain data that will be included into the final
report.  In addition to excluding records from unwanted FIPS areas, you must
also exclude records which don't belong to the sectors of the economy your
customer is interested in.

#### Excluded areas

Some rows contain data for areas that do not belong in our report.  You can
identify which lines to skip by inspecting the FIPS code column.  See the
section above titled *How to use the information from `area_titles.csv`*.


#### All Industries

Keep records where `industry_code` is equal to `"10"` and `own_code` is equal to `"0"`.


#### Software Publishing Industry

Keep records where `industry_code` is equal to `"5112"` and `own_code` is equal to `"5"`.

All other industry codes are excluded from the report.
