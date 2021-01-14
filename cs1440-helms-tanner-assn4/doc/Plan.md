*Replace the bold text with your own content*

*Adapted from https://htdp.org/2020-5-6/Book/part_preface.html*

# 0.  From Problem Analysis to Data Definitions

The problem that we are going to solve is taking some full 
functional code that has been written by another dev 
and refactor it so that it is easy to understand and read.


# 1.  System Analysis

We are going to accept command line arguments as out User Interface


# 2.  Functional Examples

We are going to have a pre written response for bad input.
If the user doesnt input a fractal, or inputs a invalid 
fractal then we will display a message.


# 3.  Function Template

Begin writing code from the architecture form step 1. 
If we get stuck or confused review steps 0 and 1 or possibly edit them 
until we have a clear understanding of how we are going to solve the problem.


# 4.  Requirements or Code Smells

~~~
 This passage foundin the file src/julia_fractal.py at line 28 is overly complicated 
'''
    return grad[77]         # Else this is a bounded sequence
    return grad[77]  # Else this is a bounded sequence
'''
Can be repalced with this since, the return is never executed

'''
    return grad[77]         # Else this is a bounded sequence

'''
~~~


~~~ 
This passage found in file src/julia_fractal.py at line 38 contains global variables
that arnt useful
 
'''
 global win
    global grad
    global photo
'''
Can be completly errased
~~~

~~~
This passage found in file src/julia_fractal.py at line 52 is using a global variables

'''
canvas = Canvas(win, width=512, height=512, bg=WHITE)
'''
Can be replaced with to avoid global variables

'''
canvas = Canvas(win, width=512, height=512, bg='#ffffff')
'''
~~~

~~~ This line found int he file src/julia_fractal.py at line 134 can be deleted 

'''
WHITE = '#ffffff'
'''
~~~

~~~
These global variables can be errased in the file src/julia_fractal.py at line 20
'''
global grad
global win
'''
~~~

~~~
More global variables can be deleted in the file src/julia_fractal.py at line 37
'''
global grad
global photo
'''
~~~

~~~
These lines can be errased as they are unuseful in the file src/julia_fractal.py at
line 55
'''

canvas.pack()  # This seems repetitive
canvas.pack()  # But it is how Larry wrote it
canvas.pack()  # Larry's a smart guy.  I'm sure he has his reasons.

area_in_pixels = 512 * 512
'''
~~~

~~~
This var can be deleted as it is never used in the file src/julia_fractal.py at
line 67 
'''
fraction = int(512 / 64)
'''
~~~

~~~
This return statement can be deleted as it is never executed in the file 
src/mbrot_fractal.py at line 48 
'''
return gradient[MAX_ITERATIONS]
'''
~~~

~~~
This global var can be deleted as it is never used in the file and shouldnt be 
global in the file src/mbrot_fractal.py at line 35

'''
global z
'''
~~~

~~~
This looks like some left over code that needs to be modified in the file
src/julia_fractal.py at line 21 
'''
for i in range(78):
'''
so that it can handle any length of gradient
'''
for i in range(len(gradient):
'''
~~~

~~~ 
This looks like somone got lazy and started messing up the naming convention 
in the file src/Images/mandelBrotImages.py at line 5 
'''
'axisLen': 2.5,
'''
Should be changed to this for consistency
'''
'axisLength': 2.5,
'''
~~~

~~~
we need to take out these random vars that have zero purpose in the file 
src/mbrot_fractal.py at line 29 

'''
MAX_ITERATIONS = len(gradient)
z = 0
'''
~~~

~~~
We should abstract away this array so that it not random code in our 
driver files in the file src/mbrot_fractal.py at line 9 
'''
# This color gradient contains 100 color steps.
gradient = [
        '#ffe4b5', '#ffe5b2', '#ffe7ae', '#ffe9ab', '#ffeaa8', '#ffeda4',
        '#ffefa1', '#fff29e', '#fff49a', '#fff797', '#fffb94', '#fffe90',
        '#fcff8d', '#f8ff8a', '#f4ff86', '#f0ff83', '#ebff80', '#e7ff7c',
        '#e2ff79', '#ddff76', '#d7ff72', '#d2ff6f', '#ccff6c', '#c6ff68',
        '#bfff65', '#b9ff62', '#b2ff5e', '#abff5b', '#a4ff58', '#9dff54',
        '#95ff51', '#8dff4e', '#85ff4a', '#7dff47', '#75ff44', '#6cff40',
        '#63ff3d', '#5aff3a', '#51ff36', '#47ff33', '#3eff30', '#34ff2c',
        '#2aff29', '#26ff2c', '#22ff30', '#1fff34', '#1cff38', '#18ff3d',
        '#15ff42', '#11ff47', '#0eff4c', '#0bff51', '#07ff57', '#04ff5d',
        '#01ff63', '#00fc69', '#00f970', '#00f677', '#00f27d', '#00ef83',
        '#00ec89', '#00e88e', '#00e594', '#00e299', '#00de9e', '#00dba3',
        '#00d8a7', '#00d4ab', '#00d1af', '#00ceb3', '#00cab7', '#00c7ba',
        '#00c4be', '#00c0c0', '#00b7bd', '#00adba', '#00a4b6', '#009cb3',
        '#0093b0', '#008bac', '#0082a9', '#007ba6', '#0073a2', '#006b9f',
        '#00649c', '#005d98', '#005695', '#004f92', '#00498e', '#00438b',
        '#003d88', '#003784', '#003181', '#002c7e', '#00277a', '#002277',
        ]
'''
~~~


~~~
We should also abstract this array away so that its not random code in our driver
in the file src/mbrot_fractal.py at line 99 
'''
images = {
        'mandelbrot': {
            'centerX': -0.6,
            'centerY': 0.0,
            'axisLen': 2.5,
            },

        'spiral0': {
            'centerX': -0.761335372924805,
            'centerY': 0.0835704803466797,
            'axisLen': 0.004978179931102462,
            },

        'spiral1': {
            'centerX': -0.747,
            'centerY': 0.1075,
            'axisLen': 0.002,
            },

        'seahorse': {
            'centerX': -0.745,
            'centerY': 0.105,
            'axisLen': 0.01,
            },

        'elephants': {
            'centerX':  0.30820836067024604,
            'centerY':  0.030620936230004017,
            'axisLen':  0.03,
            },

        'leaf': {
            'centerX': -1.543577002,
            'centerY': -0.000058690069,
            'axisLen':  0.000051248888,
            },
        }
'''
~~~

