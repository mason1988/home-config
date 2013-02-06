#!/usr/bin/python

import Tkinter as tk
import time
import pyscreenshot as ImageGrab
import sys
from Xlib import X, display, Xutil
import Xlib
import Image

class floslice:
    def __init__(self,filename):
        filename = filename
        im = Image.open(filename)
        w = im.size[0]
        h = im.size[1]

        filename = filename.rsplit(".",1)[0]
        
        slice_size = 26
        for i in range(0, h, slice_size):
            my = min(i + slice_size, h)
            buffer = Image.new("RGB", [w,slice_size],(255, 255, 255))
            slice = im.crop((0,i,w,my))
            buffer.paste(slice, (0,0))
            buffer.save("%s-%d.png"%(filename,i/slice_size),"PNG")
            
if __name__ == '__main__':
    floslice(sys.argv[1])
