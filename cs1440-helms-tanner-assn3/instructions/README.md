# CS 1440 Assignment 3 Instructions

## Important!
**I have _specifically_ instructed the CS Coaches to _not_ help you with the second portion of the assignment until you have completed the first draft of a UML class diagram.  Don't even think about writing code until you have thought through the design. Many software projects have gone awry because the design step had been neglected. Don't become another statistic - think first, code after.**

## Program Overview

In this assignment, you will design classes that work together to generate a
deck of Bingo cards.  Later, you will follow this design to create a working
program.

Bingo is a simple game where players try to mark all numbers in a row or column
or along one of the two diagonals of a Bingo card. The game and the rules of
the game of actually not important for this assignment.

All you need to know is that a Bingo card is an `N x N` grid of bingo numbers,
where `N` is the size of the card. The typical size is 5, but we'll allow card
to vary in size from 3 to 15. The numbers of cards come from a set of bingo
numbers that contains every number from `1` to `M`, where `M` is a
user-specified max between `2*N*N` and `4*N*N`. The number of cards in the deck
in a user-specified value between `3` and `10000`.

The starting project contains a text-based user interface that allows a user to
create a deck, print a card from the current deck, display the entire deck, or
save the entire deck to a file.  Unit tests are also provided, though at this
stage many tests fail as the program is incomplete.


## Part 0: The design phase

0.  Carefully study the **Program Requirements** section below
1.  Carefully study the starter code
2.  Create a UML class diagram that describes the starter code as it is today
    *   Unit tests are *not* included in this diagram
3.  Design new classes, methods and data members to satisfy the customer's
    requirements; include these new components to your UML class diagram
4.  Write your Software Development Plan in tandem with your UML class diagram.
    What you put into words in the plan should match your diagram.
5.  Create a first draft of the User Manual describing the expected user
    interface.  The interface may change as you implement the project, but you
    should strive to follow the design described by your manual.
6.  Review the UML diagram produced by two (or more) of your study buddies.
    Write a 250 word peer review for each UML diagram.  Provide a copy of this
    review to your study buddy so they can use it to improve their design.
7.  Receive copies of your study buddy's reviews of your own UML class diagram.
8.  At this stage of the project your UML class diagram does not need to
    include all of the UML concepts explained in class.
    *   At minimum, all classes and their methods and members should be
        correctly identified.
    *   Relationships between classes may be modeled as dependencies (dashed
        lines with an open-arrow pointing toward the *depended on* class).


## What to submit for the design phase

0.  Save your UML class diagram as an image (PNG or PDF are preferred) in the
    `doc/` directory of your repository.  Verify that your image is legible by
    looking at it in your browser once it has been pushed to GitLab.  In the
    past, students have submitted images with black or transparent backgrounds
    which render the image unreadable and thus ungradeable.
1.  Your software development plan `doc/Plan.md`
2.  Your sprint signature `doc/Signature.md`
3.  The first draft of the user manual `doc/Manual.md`
4.  Peer reviews that you *received from your study buddies*
    `doc/My_reviews.md`
5.  The peer reviews that *you wrote* to your study buddies in files under
    the `doc/` folder with filenames containing their names.
6.  Tag the final commit of the design phase `designed`.
    Explicitly push this tag to GitLab before midnight on the due date:
    ```
    $ git tag designed
    $ git push origin designed
    ```

At this point of the project, your repository will have a file structure like this:

```
|-- README.md
|-- instructions
|   |-- README.md
|   |-- Hints.md
|   `-- Rubric.md
|-- doc
|   |-- UML_Class_Diagram.png
|   |-- Plan.md
|   |-- Signature.md
|   |-- Manual.md
|   |-- My_reviews.md
|   |-- Jordan_Mullen-review.md
|   `-- Mary_Bartlett-review.md
`-- src
    |-- Bingo.py
    |-- Card.py
    |-- Deck.py
    |-- Menu.py
    |-- MenuOption.py
    |-- NumberSet.py
    |-- README.md
    |-- Testing
    |   |-- __init__.py
    |   |-- testCard.py
    |   |-- testDeck.py
    |   |-- testMenu.py
    |   `-- testNumberSet.py
    |-- UserInterface.py
    `-- runTests.py
```


### How to write a User Manual

The User Manual describes only the user interface of the program.  The target
audience for the manual is somebody with a little familiarity with computers
and no knowledge of Python.

The manual should answer such questions as

0. How to run the program
1. What menus will the user see
2. What responses should the user give in response to those menus
3. How to perform the basic operations of the program (in our case, how to
   create a deck, how to print cards in the deck,  how to save a deck to a
   file, how to quit the program)
4. What error messages the user may expect, and how to recover from mistakes

You may assume that your user already knows how to open a terminal and navigate
to the project directory.  

The User Manual differs from the Software Development Plan in that it should
*not* include details about *how* the program works.  The manual does not need
to describe the algorithms and data structures used by the program in order to
guide a user in running it.



### How to draw a UML class diagram

You may draw your UML class diagram using any software you prefer.  A simple
tool that I recommend is [draw.io](https://www.draw.io/)

0.  Visit https://www.draw.io/
1.  Click "Create New Diagram"
2.  Select the "Basic" "Blank Diagram" - don't use one of the pre-defined UML templates
3.  Find the UML section in the accordion list on the left-hand side of the screen

There are multiple shapes available with names like `Class`, `Class 2`, `Class 5`,
etc.  Make sure that the classes appearing on your diagram have 3 sections as
described in our lectures.

As you implement your design in Python code in the latter half of the
assignment you will undoubtedly encounter problems you hadn't foreseen.  Update
your UML diagram, users manual, and software design plan to match your code as
your design changes.  Later amendments to these documents *are not counted
against you* if you had submitted them on-time in the design phase.



## Program Requirements

0.  Your solution must include at least one class called `Deck`. This class
    must possess the following features and capabilities:
    -   Construct a deck object given the size of the cards, number of cards,
        and the maximum numbers in a bingo number set
    -   A method to print a specific card in the deck to the screen
    -   A method to print whole deck to the screen
    -   A method to print whole deck to a file of the user's choice
1.  If you don't change the method definitions already provided for you in
    `Deck.py`, you should not have to change `UserInterface.py`. You may add new
    methods and attributes to `Deck.py` as you see fit.
2.  Your solution may contain other classes besides `Deck`. In fact, it should!
    If you try to put all the functionality in the `Deck` class your solution
    will most likely have a poor design. Use the overview given above to
    identify other meaningful classes.
3.  The size of a card is an integer in the range `[3, 15]`.
    *   Bingo cards are square.
4.  A deck must contain the user-specified number of cards, within the range `[3, 10000]`.
5.  Every card is assigned a unique integer identifier.
6.  The deck should be able to retrieve a card given the identifier, so the
    user can print just that card to the screen.
7.  The bingo numbers on a card must be between `1` and `M`, where `M` is the
    user-specified maximum number in the bingo number set, within the range
    `[2*N*N, 4*N*N]`.
8.  A card cannot contain duplicates of bingo numbers. Bingo numbers may be
    duplicated between different cards within the same deck.
9.  When a new deck is created the previous deck is lost
10. Bingo cards of odd size must feature a **FREE!** square in the center.
    Even-sized cards don't have a center square and, thus, no **FREE!** square.
11. Once generated a card's appearance does not change.  When a Deck has been
    created, a card that is displayed multiple times appears identical each
    time.
12. When a card is printed to the screen or to a file, it should look like this:

    Odd-sized card:

    ```
    Card #1
    +-----+-----+-----+-----+-----+
    | 35  | 61  | 32  |  9  | 25  |
    +-----+-----+-----+-----+-----+
    |  8  | 62  | 80  | 10  | 95  |
    +-----+-----+-----+-----+-----+
    | 40  | 81  |FREE!| 73  | 74  |
    +-----+-----+-----+-----+-----+
    | 19  | 33  | 65  |  3  | 89  |
    +-----+-----+-----+-----+-----+
    | 68  | 37  | 79  | 59  | 44  |
    +-----+-----+-----+-----+-----+
    ```

    Even-sized card:

    ```
    Card #2
    +-----+-----+-----+-----+
    |  2  | 28  | 38  | 56  |
    +-----+-----+-----+-----+
    | 39  | 16  | 30  | 60  |
    +-----+-----+-----+-----+
    | 40  | 50  | 63  | 48  |
    +-----+-----+-----+-----+
    |  1  | 61  |  5  | 49  |
    +-----+-----+-----+-----+
    ```

13. When printing all a deck's cards to the screen or to a file, you may simply
    print every card, one after the other.
14. This program uses interactive menus and prompts to gather user input.
    *   This program does not use command-line arguments
    *   Prompts asking the user for numeric should display the range of numbers
        that are accepted
    *   Validate *all* user input.  Ensure that numeric input is entered as
        digits
    *   Use appropriate messages to remind the user what input is expected and
        redisplay the prompt when invalid data is entered.
15. The program  *must not*  construct any cards if the user-supplied card
    size, number of cards, or maximum of Bingo numbers is invalid.


## Part 1: The implementation  phase

Armed with a well-thought out design, now it is your job to realize in Python code the system you have created.

**I have _specifically_  instructed the tutors in the Tutor Lab to  _not_  help you with this portion of the assignment until you have completed your UML class diagram. Don't worry about starting on the code until you've first thought through your design. Many software projects have gone awry because the design step had been neglected. Don't become another statistic - think first, code after.**

0.  Implement your design, paying careful attention to the following points:
    -   You have met all requirements outlined in the previous assignment and
        your program functions accordingly
    -   All unit tests pass
1.  As your design evolves go back and update your UML class diagram, user
    manual and software development plan.  It's okay for your final design to
    be different than the one you submitted last time.  **Your UML class
    diagram must incorporate *all* non-Unittest classes in your program.  This
    means the classes you wrote as well as those that were provided.**
2.  At this stage of the project your UML class diagram *should* include all of
    the UML concepts explained in class.  Specifically, we are looking for the
    presense of these features:
    *   All data members and methods are present and correctly named
    *   Data types of data members, methods and parameters
    *   Dependencies and associations are correctly distinguished
    *   Navigability of associations is correct
    *   Multiplicity constraints are present on all associations


## Test-Driven Development

An important part of this assignment is to learn about unit tests and to gain
experience approaching a problem through the Test-Driven Development
methodology.  Writing your program to comply with the provided unit tests is
meant to guide you toward a correct and robust solution, and is worth a large
proportion of the points on this assignment.

However, you are given latitude in how your solution is structured and are free
to add, remove, or refactor classes to meet the design you crafted in UML.
It is not intended for you to take advantage of this latitude in order to avoid
unit tests.

As you craft your solution, please keep the following guidelines in mind:

*   Do not create  _trivial_  unit tests; a trivial unit test is one which unconditionally passes
*   Do not delete unit tests just because they don't pass; find ways to make your functions compatible with the unit test
*   Do not change unit tests to become less strict or trivial; instead figure out how to make your code more robust
*   If a unit test fails because you renamed a class, a method or a data member, update the unit test accordingly
*   If a unit test fails because you removed a class from your design, you must _replace_  that unit test with another non-trivial unit test
*   If a unit test fails because you moved a piece of functionality from one class to another, move that unit test into the file corresponding to the new class

_**TL;DR**_ You have been given 11 non-trivial unit tests.  Your final submission must contain _at least_  11 non-trivial unit tests.
