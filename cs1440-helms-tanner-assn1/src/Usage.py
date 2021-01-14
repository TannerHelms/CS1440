# Usage instructions and descriptions for each tool
#
# You do not need to modify this file


CAT = """tt.py cat|tac FILENAME...
    Concatenate and print files in order or in reverse"""


CUT = """tt.py cut [-f LIST] FILENAME...
    Remove comma-separated sections from each line of files
    -f  List of comma-separated integers indicating fields to output (default is LIST=1)"""


PASTE = """tt.py paste FILENAME...
    Merge lines of files into one comma-separated text"""
            

GREP = """tt.py grep [-v] PATTERN FILENAME...
    Print lines of files matching PATTERN
    -v  Invert matching; print lines which DO NOT match PATTERN"""


HEAD = """tt.py head|tail [-n N] FILENAME...
    Output the first or last part of files
    -n  Number of lines to print (default is N=10)"""


SORT = """tt.py sort FILENAME...
    Output lines of text file in sorted order"""


WC = """tt.py wc FILENAME...
    Print newline, word, and byte counts for each file"""


def usage(error=None, tool=None):
    """Provied a unified error reporting interface"""
    # Print a specific error message, if provided
    if error is not None:
        print(f"Error: {error}\n")
    
    # Print a tool-specific message where possible; otherwise, display
    # instructions for all tools
    if tool == 'cat' or tool == 'tac':
        print(f"\t{CAT}")
    elif tool == 'cut':
        print(f"\t{CUT}")
    elif tool == 'paste':
        print(f"\t{PASTE}")
    elif tool == 'grep':
        print(f"\t{GREP}")
    elif tool == 'head' or tool == 'tail':
        print(f"\t{HEAD}")
    elif tool == 'sort':
        print(f"\t{SORT}")
    elif tool == 'wc':
        print(f"\t{WC}")
    else:
        print(f"""Python Text Tools Usage
=======================

{CAT}

{CUT}

{PASTE}

{GREP}

{HEAD}

{SORT}

{WC}""")
