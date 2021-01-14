This dataset was generated from a full copy of the data file
`2019.annual.singlefile.csv` using a version of `tt.py` containing the
`startgrep` subcommand and this sequence of commands:

    tt.py head -n 1 2019.annual.singlefile.csv > header.csv
    tt.py startgrep '"15' 2019.annual.singlefile.csv > dat.csv
    tt.py grep '"0","10"' dat.csv > trimmed.csv
    tt.py cat header.csv trimmed.csv > 2019.annual.singlefile.csv
    rm header.csv dat.csv trimmed.csv

*Note: these instructions assume that `tt.py` has been **installed**.  See ../instructions/Installing_Text_Tools.md for details.*

*If your Text Tools are incomplete or incorrect, you can still create the smaller testing data set.  Run the above commands without `tt.py`.  In the place of `startgrep '^"15'` use `grep '^"15'`*
