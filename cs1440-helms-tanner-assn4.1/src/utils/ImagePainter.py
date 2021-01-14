"""
Creates a `Tk` window and a  `PhotoImage`  object; the
    `PhotoImage`  stores the pixels and is capable of creating a PNG image file
"""
from tkinter import Tk, PhotoImage, Canvas


class ImagePainter:
    def __init__(self, width, height, backgroundColor):
        self.win = Tk()
        self.photoImage = PhotoImage(width=width, height=height)
        self.canvas = Canvas(self.win, width=width, height=height, bg=backgroundColor)
        self.canvas.pack()
        self.canvas.create_image((256, 256), image=self.photoImage, state="normal")
