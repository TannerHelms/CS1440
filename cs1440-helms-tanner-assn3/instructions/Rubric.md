# CS 1440 Assignment 3 Rubric

| Points | Criteria
|:------:|--------------------------------------------------------------------------------
| 10     | 1st draft UML class diagram describes supplied classes' relationships, data members and methods accurately
| 10     | 1st draft UML class diagram describes new classes' relationships, data members and methods
| 5      | 1st draft UML class diagram adheres to UML standards as far as these were explained in class
| 10     | 1st draft Users' Manual describes the program's User Interface<br/>Instructions are appropriate for the intended audience
| 10     | At least two peer reviews (at least 250 words each) are present<br/>Peer reviews written by your study buddies are also included
| 20     | Final code implements all features required by the Program Requirements Specification
| 10     | Final code matches the final draft UML class diagram and Software Development Plan
| 5      | Final draft User's Manual accurately describes user interface of the final product
| 20     | All supplied Unit Tests pass<br/>Unit Tests are meaningful; no trivial unit tests are present; suitable replacements are provided if your design invalidates any supplied tests

**Total points: 100**


## Penalties

Review the [Course Rules](https://gitlab.cs.usu.edu/erik.falor/fa20-cs1440-lecturenotes/blob/master/Course_Rules.md)
document to avoid general penalties which apply to all assignments.  

Don't forget your Sprint Signature and Software Development Plan (-10pts each if missing)

Additionally, this assignment is subject to the following penalties:

0.  **10 point penalty** if `eval()` or a similar function is used by your
    program.  You should use `int()` instead.
1.  **15 point penalty**  if your UML diagram is unreadable.  Watch out for a
    transparent background (in draw.io, click File -> Export as -> PNG..., then
    make sure that the option "Transparent background" is left unchecked).
    Make sure that the background isn't black, as this obscures the lines
    connecting classes to each other.  Make sure that the file size is large
    enough to make the text legible, and that the colors of the diagram stand
    out in sharp contrast to the background.
2.  **10 point penalty** if any files are not closed after being processed in
    _ordinary_  situations.  In the event of an error your program will display
    an error message and immediately exit; in such cases you do not need to
    take special measures to close files because they will automatically be
    closed by the OS as your program exits.
3.  **10 point penalty** for each  _trivial_ unit test (i.e. a unit test which
    unconditionally passes without meaningfully testing some functionality)
