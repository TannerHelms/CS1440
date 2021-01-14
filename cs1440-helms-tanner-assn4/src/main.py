from utils.ImagePainter import ImagePainter
from fractals import Julia, Mandelbrot
from utils import FractalSelection
from tkinter import mainloop

# Set vars for the height, width and background color of the GUI
from utils import FractalFactory, GradientFactory

backgroundColorOfWindow = '#ffffff'

if __name__ == '__main__':

    # Check the sys.args for valid input before the program continues to run
    try:
        fractalArray = FractalSelection.getImageFromUserInput()
    except:
        raise NotImplementedError("Incorrect format in fractal configuration file")

    heightOfWindow = 600
    widthOfWindow = 600

    # Create an instance of imagePainter that will be used as a GUI for this program
    imagePainter = ImagePainter(widthOfWindow, heightOfWindow, backgroundColorOfWindow)

    # Figure out how the boundaries of the PhotoImage relate to coordinates on
    # the imaginary plane.
    minx = fractalArray['centerX'] - (fractalArray['axisLength'] / 2.0)
    maxx = fractalArray['centerX'] + (fractalArray['axisLength'] / 2.0)
    miny = fractalArray['centerY'] - (fractalArray['axisLength'] / 2.0)

    size = abs(maxx - minx) / widthOfWindow

    fractal = FractalFactory.makeFractal(fractalArray["type"], fractalArray["iterations"])

    gradient = GradientFactory.makeGradient(fractalArray["iterations"])

    # Loop through each row in the window
    for row in range(heightOfWindow, 0, -1):

        # Loop through each column in the window
        for column in range(widthOfWindow):
            x = minx + column * size
            y = miny + row * size

            n = fractal.count(complex(x, y))

            color = gradient.getColor(n)

            # Print the pixel to the photoImage
            imagePainter.photoImage.put(color, (column, widthOfWindow - row))

        # Update the window with the photoImage that we just created
        imagePainter.win.update()

    fileName = fractalArray["nameOfFile"]

    # Save the fractal
    imagePainter.photoImage.write(fileName + ".png")

    # Tell the user that we have saved and crated the picture
    print(f"Wrote image {fileName}.png")

    # Keep the GUI open
    mainloop()
