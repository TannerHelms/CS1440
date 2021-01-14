from utils.ImagePainter import ImagePainter
from utils import FractalSelection, FractalFactory, GradientFactory
from tkinter import mainloop

# Set vars for the height, width and background color of the GUI
heightOfWindow = 512
widthOfWindow = 512
backgroundColorOfWindow = '#ffffff'

if __name__ == '__main__':

    # Check the sys.args for valid input before the program continues to run
    image, fractalArray = FractalSelection.getImageFromUserInput()

    gradient = GradientFactory.makeGradient()

    # Create an instance of imagePainter that will be used as a GUI for this program
    imagePainter = ImagePainter(widthOfWindow, heightOfWindow, backgroundColorOfWindow)

    # Figure out how the boundaries of the PhotoImage relate to coordinates on
    # the imaginary plane.
    minx = fractalArray['centerx'] - (fractalArray['axislength'] / 2.0)
    maxx = fractalArray['centerx'] + (fractalArray['axislength'] / 2.0)
    miny = fractalArray['centery'] - (fractalArray['axislength'] / 2.0)

    size = abs(maxx - minx) / 512

    fractal = FractalFactory.makeFractal(fractalArray["type"], fractalArray["iterations"])

    # Loop through each row in the window
    for row in range(heightOfWindow, 0, -1):

        # Loop through each column in the window
        for column in range(widthOfWindow):
            x = minx + column * size
            y = miny + row * size

            c = complex(x, y)

            color = gradient.getColor(fractal.count(c))

            # Print the pixel to the photoImage
            imagePainter.photoImage.put(color, (column, 512 - row))

        # Update the window with the photoImage that we just created
        imagePainter.win.update()

    # Save the fractal
    imagePainter.photoImage.write(image + ".png")

    # Tell the user that we have saved and crated the picture
    print(f"Wrote image {image}.png")

    # Keep the GUI open
    mainloop()
