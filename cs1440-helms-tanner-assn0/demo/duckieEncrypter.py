import os, sys


def sendError(string=""):
    if string == "":
        string = "Error! The supplied text file does not exist or is not accessible."
    print(f"""\
================================================================================
{string}
================================================================================
""")
    sys.exit(1)


def getFiles(textFile=""):
    if textFile == "":
        textFile = input("Please select a text file to parse: ")
    if not os.access(textFile, os.R_OK):
        sendError(string=f"Error! The supplied text file {textFile} does not exist or is not accessible.")
    file = open(textFile)
    return file


def convertLower(char):
    startLetterOrd = ord("a")
    num = ord(char)
    return "_" + str(num - startLetterOrd)


def convertUpper(char):
    startLetterOrd = ord("A")
    num = ord(char)
    return "^" + str(num - startLetterOrd)


def convertSpecialChar(char):
    charOrd = ord(char)
    # range for (" " to "/"), ords (32 to 47)
    if ord(" ") <= charOrd <= ord("@"):
        base = ord(" ")
        diff = charOrd - base
        return "+A" + str(diff)
    elif ord("[") <= charOrd <= ord("`"):
        base = ord("[")
        diff = charOrd - base
        return "+B" + str(diff)
    elif ord("{") <= charOrd <= ord("~"):
        base = ord("{")
        diff = charOrd - base
        return "+C" + str(diff)
    else:
        # Python evaluates`None` to be `False`.
        return None


def cryptLine(line):
    output = ""
    line = line.rstrip()
    for char in line:
        if char.isupper():
            output += convertUpper(char) + " "
        elif char.islower():
            output += convertLower(char) + " "
        elif specChar := convertSpecialChar(char):
            output += specChar + " "
        else:
            sendError(f"Error! the character {char} is not a valid character to be crypted.")
    return output


def main():
    if len(sys.argv) < 2:
        line = input("Please enter something to crypt: ")
        print(cryptLine(line))
    if len(sys.argv) == 2:
        if sys.argv[1].lower() == '-h' or sys.argv[1].lower() == '--help':
            print(f"""\
USAGE: $ python duckieEncrypter.py [FILE]

[FILE] is an optional argument that is the path to a text file to encrypt.

If [FILE] is not given, the user is prompted to enter a single line of text
    input to encrypt.""")
        else:
            file = getFiles(sys.argv[1])
            for line in file.readlines():
                line = cryptLine(line)
                print(line)
            file.close()


if __name__ == '__main__':
    main()
