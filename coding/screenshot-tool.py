#!/usr/bin/python

import Tkinter as tk
import time
import pyscreenshot as ImageGrab
import sys
from Xlib import X, display, Xutil
import Xlib
import slicing_tool

class floshot:
    def __init__(self,display,pic_name):
        print "das initialisieren beginnt"
        self.filename = pic_name
        self.d = display
        self.screen = self.d.screen()
        self.window = self.screen.root
        
        self.window.grab_pointer(1, X.PointerMotionMask|X.ButtonReleaseMask|X.ButtonPressMask,
                X.GrabModeAsync, X.GrabModeAsync, X.NONE, X.NONE, X.CurrentTime)
#        self.window.change_attributes(event_mask=Xlib.X.ButtonPressMask | Xlib.X.ButtonReleaseMask)      
        self.initialize_drawing()
        print "gleich gehts dann los"
        state = 0  #0 = warte auf ersten klick, 1 = warte auf 2ten
        while state <= 1:
            e = self.window.display.next_event()
            if e.type == X.ButtonPress:
                print "eine taste wurde gedrueckt"
                if e.detail == 1:
                    print "linke maustaste gedrueckt"
                    if state == 0:
                        print "gehe zu state 1"
                        self.start_x = e.root_x
                        self.start_y = e.root_y
                        state = 1
                    elif state == 1:
                        print "gehe zu state 2"
                        self.end_x = e.root_x
                        self.end_y = e.root_y
#                        self.d.ungrab_pointer(X.CurrentTime)
#                        self.window.display.ungrab_pointer(X.CurrentTime)
                        self.shot()
                        state = 2
                    
    def shot(self):
        print "es wird geshottet"
        
        if self.start_x > self.end_x:
            tmp = self.start_x
            self.start_x = self.end_x
            self.end_x = tmp
        if self.start_y > self.end_y:
            tmp = self.start_y
            self.start_y = self.end_y
            self.end_y = tmp
        print "startx: "
        print self.start_x
        print "endx: "
        print self.end_x
        print "starty:"
        print self.start_y
        print "end_y"
        print self.end_y

        time.sleep(0.5)
        
        img = ImageGrab.grab(bbox = (self.start_x,self.start_y,self.end_x,self.end_y))
        img.save(self.filename)
        if self.end_y - self.start_y > 200:
            slicing_tool.floslice(self.filename)
        
    def initialize_drawing(self):
        print "regulaere initialeze funk aufgerufen"
        colormap = self.screen.default_colormap
        color = colormap.alloc_color(0, 0, 65535)
        # Xor it because we'll draw with X.GXxor function 
        xor_color = color.pixel ^ 0xffffff 
        print hex(color.pixel), hex(xor_color) 
        self.gc = self.window.create_gc(
            line_width = 4,
            line_style = X.LineSolid,
            fill_style = X.FillOpaqueStippled,
            fill_rule  = X.WindingRule,
            cap_style  = X.CapButt,
            join_style = X.JoinMiter,
            foreground = xor_color,
            background = self.screen.black_pixel,
            function = X.GXxor, 
            graphics_exposures = False,
            subwindow_mode = X.IncludeInferiors,
            )
        print "und sie ist fertig"

if __name__ == '__main__':
    floshot(display.Display(),sys.argv[1]) 
