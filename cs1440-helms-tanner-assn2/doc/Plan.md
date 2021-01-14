*Replace the bold text with your own content*

*Adapted from https://htdp.org/2020-5-6/Book/part_preface.html*

# 0.  From Problem Analysis to Data Definitions

The problem that we are going to solve is that we need to gather statistics 
from the files that are provided from the user


# 1.  System Analysis

The flow of the program will be as follows:
    * Get the directory for the files from the user
    * Open the files
    * Begin scanning each line of the file
    * For each line we need to do the following:
        * Verify the FIPS 
        * Determine which type the FIPS is
        * Calculate the statistics for it
    * Print out the statistics


# 2.  Functional Examples

Ask the user for a directory and crash the program if it is invalid

# 3.  Function Template

Begin writing code from the architecture from step 1. If we get stuck or confused review
steps 0 and 1 or possibly edit them until we have a clear understanding of how
we are going to solve the problem




# 5.  Testing

Run the test cases against the code to verify that the outcome of the program
is the outcome that we are expecting. Attempt throwing some edge cases at your
program to guarantee that it is going to work
