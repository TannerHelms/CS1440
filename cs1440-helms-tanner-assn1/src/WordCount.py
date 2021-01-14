import os
import sys

fileNames = []
readFiles = []
fileCounts = []
totals = [0, 0, 0, "total"]
printCounts = []
longestValue = 0

'''
wc executes the following...
    * Opens the files
    * Get the text from the files and adds up the line 
        count, word count and character count
    * Gets the longest count for formatting
    * Totals all the counts for a total value
    * Formats the array so that it can be printed
    * Prints the formatted array
'''


def wc(files):
    OpenFiles(files)
    GetCountValues()
    GetLongestCountValue()
    GetTotals()
    FormatCountValues()
    Print()


# GetCountValues gets the word count, line count and the character count and
# creates an array containing these values

def GetCountValues():
    index = 0
    for f in readFiles:
        counts = [GetWordCount(f), GetLineCount(f), GetCharacterCount(f),
                  fileNames[index]]
        fileCounts.append(counts)
        index += 1


# GetWordCount gets the total count for all the words in the
# provided file


def GetWordCount(file):
    return len(file.replace("\n", " ").split(" ")) - 1


# GetCharacterCount returns the amount of characters that are in the
# provided file


def GetCharacterCount(file):
    count = 0
    for _ in file:
        count += 1
    return count


# GetLineCount returns the amount of lines in the provided file


def GetLineCount(file):
    return len(file.split("\n")) - 1


# GetTotals, totals up all of the amounts of line counts,
# character counts and word counts and creates an array
# for them


def GetTotals():
    for fc in fileCounts:
        for i in range(0, 3):
            totals[i] += fc[i]


# GetLongestCountValue, gets the longest value in terms of a string
#  for formatting when printing the values


def GetLongestCountValue():
    lv = 0
    for counts in fileCounts:
        # Range over the word count, line count, and character account
        # and get the longest number in terms of a string
        for i in range(0, 3):
            if len(str(counts[i])) > lv:
                lv = len(str(counts[i]))
    global longestValue
    longestValue = lv + 1


# OpenFiles, opens the files that are needed for this tool


def OpenFiles(files):
    for f in files:
        # Check to see if we can access the file
        if os.access(f, os.R_OK):
            txt = open(f)
            fileNames.append(txt.name)
            readFiles.append(txt.read())
            continue
        # Return an error if we arnt able to access the file and exit
        print("Invalid file path")
        sys.exit(1)


# FormatCountValues creates a formatted array for all of the values
# that can be latter printed to the console


def FormatCountValues():
    global longestValue
    # Append the totals array if there is more then one
    # file
    if len(fileCounts) > 1:
        fileCounts.append(totals)
    for fc in fileCounts:
        newArr = []
        for c in fc:
            newString = str(c)
            # Add spaces to the beginning of the value until its equal to
            # the longestValue in the table
            while len(newString) <= longestValue:
                newString = " " + newString
            newArr.append(newString)
        # Add a couple spaces for the names of the files
        newArr[-1] = "  " + newArr[-1]
        printCounts.append(newArr)


# Print prints the formatted array to the console


def Print():
    global printCounts
    for pc in printCounts:
        for c in pc:
            print(c, end='')
        print()
