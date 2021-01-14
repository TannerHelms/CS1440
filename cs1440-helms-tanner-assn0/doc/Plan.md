*Replace the bold text with your own content*

*Adapted from https://htdp.org/2020-5-6/Book/part_preface.html*

# 0.  From Problem Analysis to Data Definitions

The problem that we are going to address is taking input form a user via file 
and translating it into DuckieCrypt. We will need to go character to character
from the user input and Crypt the character based on some things. The first 
thing we need to do is identify the flag. The flags are the following...
    * ^ - UpperCase Letter
    * _ - LowerCase Letter
    * +A | +B | +C - Special charaters
Once we have identified the flag we need to get the character code value 
using ASCII. Then we need to subtract the value of the first value in that set.
For example, in ASCII upper case letters start with a code value of 65 (A). By
subtracting 65 from this value we will get the duckieCrypt of ^0. Once we have
identified the value of the string and the Crypt, we need to add it to a string
that will later be returned to the main funcion for later usage such as print() 


# 1.  System Analysis

Flow of the program
 1. Ask for user input via file
 2. Verify the location of the file so that we dont panic if it doesnt exist
    2a. Exit the program (QUACK) if there is an err attempting to find the file
 3. Begin scanning the file character by character
    3a. Identify the flag of the character
    3b. identify the DuckieCrypt value of the character
 4. Add the value from the DuckCrypt to a main string
 5. Return the string back to the caller


# 2.  Functional Examples

Ask the user for the file. If we are not able to access the file then exit the program


# 3.  Function Template

Begin writing code from the architecture from step 1. If we get stuck or confused review
steps 0 and 1 or possibly edit them until we have a clear understanding of how
we are going to solve the problem


# 5.  Testing

Run the test cases against the code to verify that the outcome of the program
is the outcome that we are expecting. Attempt throwing some edge cases at your
program to guarantee that it is going to work

