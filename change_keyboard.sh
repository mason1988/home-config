$!/bin/bash
xmodmap -e "clear mod[2 3 4 5]"
xmodmap -e "clear mod1"
xmodmap -e "clear shift"

xmodmap -e 'clear lock'
xmodmap -e 'clear control'
xmodmap -e 'keycode 49 = Control_L'
xmodmap -e 'add control = Control_L'
xmodmap -e 'add control = Control_R'
xmodmap -e 'keycode 94 = Control_R'
