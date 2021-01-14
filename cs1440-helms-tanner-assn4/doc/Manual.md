# Fractal Visualizer User Manual


The pupose of the program is for the user to use the command line 
args to draw a fractal. In order to sucessfully created a fractal 
image you need to do the following: 
    1) Open some sort of termainal/command prompt in the src directory
    2) In the termainl you need to type in main.py and then one of the following
            argument depending on which fractal you want to draw:
        fulljulia
        hourglass
        lakes
        mandelbrot
        spiral0
        spiral1
        seahorse
        elephants
        leaf
    3) If you mess the last step up and input a invalid fractal or dont input one at all
            a menu will be displayed asking you to input a valid fractal
    4) Once a valid fractal has been inputed through the command line args, the program will
            do the rest of the work, creating a window to display the fractal you have choose 
            and proceed to draw the image
    5) Once the program is done, the program will keep the window open until you are ready to close it.
            The fractal you choose to draw will also be saved as a file
    6) At this point, the program has finished its job and you may continue to view the new drawing 
            on the window displayed, or close that window and the program will exit. You then can 
            view the new image that is saved in your src folder. Or restart at step 1 and draw 
            a new image