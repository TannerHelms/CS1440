# CS 1440 Assignment 3 Hints

## Design hints

* Carefully study the Program Requirements Specification and the starter code.
* Translate the requirements into your own words
* Write your user's manual first.  You will find it helpful to envision the
  user interface before you realize it in code.
* Decide which classes are provided for you, and what features each has
* Decide which classes you need to add to the program.  Ask yourself these questions as you work:
    * Does this functionality belong in a class that was provided by the starter code?
    * Does this functionality belong in a new class that I must write myself?
    * How will objects of the new class relate to other classes in the system?
* Translate your own rendering of the requirements into pseudocode
* Translate your pseudocode into Python



## UML hints

* Unit Tests should not be included in the Class diagram.
* Focus first on *what* classes are needed and what members and methods they will need.
* When you know what classes your solution contains, then you can decide how
  they will relate to each other.  It is likely that you will need to change
  the design of your classes a few times as you go.
* It is *much* easier to re-design a class in UML than it is in Python.



## Python hints

* An easy way to ensure that numeric user input is actually numeric is to use
  Python's `str.isnumeric()` string method.
* The `NumberSet` class prevents numbers from being re-used on the same card.
  For instance, each card can only have the number `7` once.  But it's okay if
  every card in the deck has the number `7`.
* Each time I ask the program to print card #7 from the same deck, I should see
  the same numbers in the same positions.  When I generate a new deck, however,
  card #7 will likely look different.
* Don't re-write or simplify your unit tests just to make them pass.  When a
  test fails it is telling you important information about failures in your
  design.  Reconsider your design.
* Instructions for running your Unit Tests can be found in the lecture notes
  repository on
  [GitLab](https://gitlab.cs.usu.edu/erik.falor/sp20-cs1440-lecturenotes/blob/master/Module3/UnitTests.md)
