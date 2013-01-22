#!/bin/bash
setxkbmap de
xmodmap /home/florian/tasta_stuff/neo_de.xmodmap
xset -r 51
xmodmap -e 'clear lock'
xmodmap -e 'clear mod1'
xmodmap -e 'clear mod2'
xmodmap -e 'clear mod3'
xmodmap -e 'clear mod4'
xmodmap -e 'clear mod5'
xmodmap -e 'clear shift'
xmodmap -e 'clear control'
xmodmap -e 'keycode 94 = Control_L'
xmodmap -e 'add control = Control_L'
xmodmap -e 'add control = Control_R'
xmodmap -e 'add shift = Shift_R'
xmodmap -e 'add shift = Shift_L'
xmodmap -e 'add mod1 = Alt_L'
xmodmap -e 'add mod1 = Meta_L'
xmodmap -e 'add mod4 = Super_L'
xmodmap -e 'add mod4 = Super_R'
xmodmap -e 'add mod4 = Hyper_L'
xmodmap -e 'add mod5 = ISO_Level3_Shift'
xmodmap -e 'add mod5 = Mode_switch'
