Peer reviews I received:
Tanner I really like your diagram! It shows that you have a good  idea 
of the flow of the program and how it should all work. It is a very simple 
design but it still communicates the ideas you are trying to get across 
quite well. All of the variables you have are easy to understand and 
because of this it makes sense how they interact between the classes. 
The top to bottom flow of the chart also adds to its readability of this.

One way that you could improve this would be by identifying what varriable 
type is in each list, This would make it a bit clearer to read and to the 
flow that you already have in your ULM diagram. Another such wasy that this 
could be improved would be by the addition of an options menu class. I believe 
that this is missing and it it quite important as it dicatates the options that 
you will be giving the user to interact with your program. If you were to add 
this in I think that your UML Diagram would be just about perfect. 

Overall I think that this UML diagram does its job very well without 
leaving any information out. I hope that you find this helpful!


Peer reviews done by me:

HI Daniel your UML looks very good and organized. You can tell that you 
understand the flow of the program and have a good overview of how you are 
going to organize it. I like the simplicity of it and it is easy to understand 
and follow.  Here are a couple think that I think you could improve on.
First is your user Interface. Technically a interface contains abstract 
methods that need to be implemented by classes. A interface should only 
contain these abstract methods and not have any variables. So basically 
all the logic is hidden behind the interface such that the classes you use 
to implement the interface contain all the logic and not the interface. 

Next thing you could improve on is coming up with better naming conventions 
for your variables and methods. For example, I am a little confused looking 
at your MenuOption class. If i were just to simply look at your method called 
getDsc, I would be a little confused on what that method would do. Something 
to also think about is in your Card class, you have a var called cardID. I 
would consider changing this to simply id as it would be repetitive to call 
Card.cardID. Another confusing naming convention is your NumberSet class. 
Your class is called NumberSet but there isn't any sets that are in the class.
NumberSet.numSet is a type int but is called a set which doesnt quite make 
since.  You also have a method on that class called getSize, im not sure what 
this would return as there are no vars called size.

Next thing you could improve on is your Deck class. Looking at this UML, I 
am a little confused on how this class would work as there is a method called 
getCard that returns a Card but where is this Card stored? If the getCard method 
doesnt take in anything for a parameter, which card are we selecting? I think 
you need to create a var that is either a hash map or array to be able to store 
these Cards that you are creating. For the method print, what are you going to
print if there are no vars storing instances of Card's?  Also wouldn't deckSize 
be a better var name then numCards if that var is storing how many cards are 
in the deck? Last thing, you have an arrow from the Card class to NumberSet. 
Why would the Card class need to interact with the NumberSet? Shouldn't only 
the Card be interacting with NumberSet when building a Card?

Last thing, just go through your methods and class names to make sure 
that you can very easily identify what the purpose of them are without looking 
at the code. When you have bigger projects, you could be working with over 100 
different classes. If you have to go look at each class one by one while 
programing to double check what they do, that will be very annoying.


Second Review done by me:
Hi Hailey,
Your diagram is very well organized and it is clear that you understand the task 
the has been given to you. I like how you have used abstraction to separate 
your code into different classes. I think you have done a very good job on 
coming up with what classes to create and organize them.

The first thing I think you could improve on is your naming conventions. 
There are quite a few of vars and methods that could be confusing for other 
people. One of your classes is named NumberSet, but contains no sets of numbers 
in it. If the class is called NumberSet shouldn't there be a var that has a 
set of numbers? I am just a little confused on how this class would be actually 
implemented in code. One of the methods is called getNext(), what will this 
method do is the data types of the vars are integers'? If I had no idea what 
this project was about I would probably think that getNext would increment one 
of the vars and return the next integer. What does randomize do? To me I would 
think that it would have some type of data and it would randomize the order of the data. 

Next thing is on your Card class, your print method returns a file making me 
guess that this method will create a file and print the card into it. This wouldnt 
quite make sense in the Card class because if the user chooses to save the whole 
deck to the file we would only have access to the current card. If you are trying 
to save the card to a file, this needs to be done at a higher level such as Deck 
where the Deck would have access to all the Card's. What you would want is a 
method called print() in the Card class that would print the Card to the console. 

Next thing is, in your Deck class. it looks like you dont have a var that would 
store the Card to the deck. you could use a hash map [Card.id]Card or an array/list 
that would hold all the cards. I am also a little confused on what your method 
getCard(n:int):int would do. I would think a getCard method would taking in a card 
id as a parameter and return the card but instead your returning an integer. So 
consider renaming that method as getCard does not return a Card. There is also a 
method called getCardCount, I would consider changing this to getDeckSize. That 
would make more since to me. 

Next is the UserInterface class. First, this actually isnt an interface. An 
interface only contains abstract methods and does not store data on it, as it 
is meant to be implemented one or more classes. There is a var on UserInterface 
called keepGoing. I see what your trying to do here but would it be better to 
just throw everything in a while(true){} and then break out of it if needed? 
Not sure how you would use this var. There is also another var called size, 
shouldn't this be stored on the Deck so that we could call Deck.getSize()? Why 
is there a cardToPrint var? If we are going to print a card shouldnt we ask 
the user for a id and then call Deck.printCard(id:int)? Why are there vars called 
fileName and outputFile? if we are going to save the Deck to a file, wouldnt 
we want to ask user for input and then call something like Deck.Save(f:file). 
I will stop there but consider some of these things as it could make your life 
a lot easier and a lot less code to write. Make sure that your vars and methods 
have a lot of meaning and purpose and are not just there to be there.



