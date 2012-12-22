-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Anwendungen_Audio"] = {
	{"aumix", "x-terminal-emulator -e ".."/usr/bin/aumix","/usr/share/pixmaps/aumix.xpm"},
	{"Banshee","/usr/bin/banshee","/usr/share/pixmaps/banshee.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
}
Debian_menu["Debian_Anwendungen_Barrierefreiheit"] = {
	{"xbindkeys","/usr/bin/xbindkeys"},
	{"Xmag","xmag"},
}
Debian_menu["Debian_Anwendungen_Betrachter"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"gThumb Image Viewer","/usr/bin/gthumb","/usr/share/pixmaps/gthumb.xpm"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
}
Debian_menu["Debian_Anwendungen_Büro"] = {
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
}
Debian_menu["Debian_Anwendungen_Dateiverwaltung"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"kupfer","/usr/bin/kupfer"},
	{"Nemo","/usr/bin/nemo","/usr/share/pixmaps/nemo.xpm"},
}
Debian_menu["Debian_Anwendungen_Datenverwaltung"] = {
	{"LibreOffice Base","/usr/bin/libreoffice --base","/usr/share/icons/hicolor/32x32/apps/libreoffice-base.xpm"},
	{"Tomboy","/usr/bin/tomboy"},
}
Debian_menu["Debian_Anwendungen_Editoren"] = {
	{"Emacs 23 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs23 -nw"},
	{"Emacs 23 (X11)","/usr/bin/emacs23"},
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Anwendungen_Grafik"] = {
	{"ImageMagick","/usr/bin/display.im6 logo:","/usr/share/pixmaps/display.im6.xpm"},
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Anwendungen_Netzwerk_Dateiübertragung"] = {
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Anwendungen_Netzwerk_Kommunikation"] = {
	{"Irssi", "x-terminal-emulator -e ".."/usr/bin/irssi"},
	{"Pidgin","/usr/bin/pidgin","/usr/share/pixmaps/pidgin-menu.xpm"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Xbiff","xbiff"},
	{"X Chat","/usr/bin/xchat","/usr/share/icons/xchat.xpm"},
}
Debian_menu["Debian_Anwendungen_Netzwerk_Web-Surfen"] = {
	{"Google Chrome","/opt/google/chrome/google-chrome","/opt/google/chrome/product_logo_32.xpm"},
	{"Links 2","/usr/bin/links2 -g","/usr/share/pixmaps/links2.xpm"},
	{"Links 2 (text)", "x-terminal-emulator -e ".."/usr/bin/links2","/usr/share/pixmaps/links2.xpm"},
	{"Lynx-cur", "x-terminal-emulator -e ".."lynx"},
	{"Opera","/usr/bin/opera","/usr/share/pixmaps/opera-browser.xpm"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Anwendungen_Netzwerk"] = {
	{ "Dateiübertragung", Debian_menu["Debian_Anwendungen_Netzwerk_Dateiübertragung"] },
	{ "Kommunikation", Debian_menu["Debian_Anwendungen_Netzwerk_Kommunikation"] },
	{ "Web-Surfen", Debian_menu["Debian_Anwendungen_Netzwerk_Web-Surfen"] },
}
Debian_menu["Debian_Anwendungen_Programmierung"] = {
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.2)", "x-terminal-emulator -e ".."/usr/bin/python3.2","/usr/share/pixmaps/python3.2.xpm"},
	{"Ruby (irb1.9.1)", "x-terminal-emulator -e ".."/usr/bin/irb1.9.1"},
	{"Tclsh8.4", "x-terminal-emulator -e ".."/usr/bin/tclsh8.4"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"TkWish8.4","x-terminal-emulator -e /usr/bin/wish8.4"},
}
Debian_menu["Debian_Anwendungen_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Anwendungen_System_Administration"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center",},
	{"GNOME partition editor","su-to-root -X -c /usr/sbin/gparted","/usr/share/pixmaps/gparted.xpm"},
	{"MDM flexiserver","mdmflexiserver","/usr/share/pixmaps/mdm.xpm"},
	{"MDM flexiserver in Xnest","mdmflexiserver -n","/usr/share/pixmaps/mdm.xpm"},
	{"MDM Photo Setup","mdmphotosetup","/usr/share/pixmaps/mdm.xpm"},
	{"MDM Setup","su-to-root -X -p root -c /usr/sbin/mdmsetup","/usr/share/pixmaps/mdm.xpm"},
	{"Openbox Configuration Manager","/usr/bin/obconf","/usr/share/pixmaps/obconf.xpm"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"System Information","/usr/bin/hardinfo","/usr/share/pixmaps/hardinfo.xpm"},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"XBindKeys-config","/usr/bin/xbindkeys-config"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"xkbind","/usr/bin/xkbind"},
	{"xkeycaps","/usr/bin/xkeycaps"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
	{"x-tile","/usr/bin/x-tile"},
	{"xxkb","/usr/bin/xxkb"},
}
Debian_menu["Debian_Anwendungen_System_Hardware"] = {
	{"Windows Wireless Drivers","su-to-root -X -c /usr/sbin/ndisgtk","/usr/share/pixmaps/ndisgtk.xpm"},
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Anwendungen_System_Paketverwaltung"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Anwendungen_System_Sicherheit"] = {
	{"gufw","/usr/bin/gufw"},
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
}
Debian_menu["Debian_Anwendungen_System_Sprachumgebung"] = {
	{"Input Method Swicher", "x-terminal-emulator -e ".."/usr/bin/im-switch"},
}
Debian_menu["Debian_Anwendungen_System_Überwachung"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Anwendungen_System"] = {
	{ "Administration", Debian_menu["Debian_Anwendungen_System_Administration"] },
	{ "Hardware", Debian_menu["Debian_Anwendungen_System_Hardware"] },
	{ "Paketverwaltung", Debian_menu["Debian_Anwendungen_System_Paketverwaltung"] },
	{ "Sicherheit", Debian_menu["Debian_Anwendungen_System_Sicherheit"] },
	{ "Sprachumgebung", Debian_menu["Debian_Anwendungen_System_Sprachumgebung"] },
	{ "Überwachung", Debian_menu["Debian_Anwendungen_System_Überwachung"] },
}
Debian_menu["Debian_Anwendungen_Terminalemulatoren"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"Xfce Terminal","/usr/bin/xfce4-terminal","/usr/share/pixmaps/terminal.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Anwendungen_Text"] = {
	{"Character map","/usr/bin/gucharmap"},
	{"dvtm", "x-terminal-emulator -e ".."/usr/bin/dvtm"},
	{"Fortune","sh -c 'while /usr/games/fortune | col -x | xmessage -center -buttons OK:1,Another:0 -default OK -file - ; do :; done'"},
}
Debian_menu["Debian_Anwendungen_Video"] = {
	{"GNOME MPlayer","gnome-mplayer","/usr/share/pixmaps/gnome-mplayer.xpm"},
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Anwendungen_Werkzeuge"] = {
	{"fookb-plainx","/usr/bin/fookb-plainx"},
}
Debian_menu["Debian_Anwendungen_Wissenschaft_Mathematik"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"GCalcTool","/usr/bin/gcalctool","/usr/share/pixmaps/gcalctool.xpm"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Anwendungen_Wissenschaft"] = {
	{ "Mathematik", Debian_menu["Debian_Anwendungen_Wissenschaft_Mathematik"] },
}
Debian_menu["Debian_Anwendungen"] = {
	{ "Audio", Debian_menu["Debian_Anwendungen_Audio"] },
	{ "Barrierefreiheit", Debian_menu["Debian_Anwendungen_Barrierefreiheit"] },
	{ "Betrachter", Debian_menu["Debian_Anwendungen_Betrachter"] },
	{ "Büro", Debian_menu["Debian_Anwendungen_Büro"] },
	{ "Dateiverwaltung", Debian_menu["Debian_Anwendungen_Dateiverwaltung"] },
	{ "Datenverwaltung", Debian_menu["Debian_Anwendungen_Datenverwaltung"] },
	{ "Editoren", Debian_menu["Debian_Anwendungen_Editoren"] },
	{ "Grafik", Debian_menu["Debian_Anwendungen_Grafik"] },
	{ "Netzwerk", Debian_menu["Debian_Anwendungen_Netzwerk"] },
	{ "Programmierung", Debian_menu["Debian_Anwendungen_Programmierung"] },
	{ "Shells", Debian_menu["Debian_Anwendungen_Shells"] },
	{ "System", Debian_menu["Debian_Anwendungen_System"] },
	{ "Terminalemulatoren", Debian_menu["Debian_Anwendungen_Terminalemulatoren"] },
	{ "Text", Debian_menu["Debian_Anwendungen_Text"] },
	{ "Video", Debian_menu["Debian_Anwendungen_Video"] },
	{ "Werkzeuge", Debian_menu["Debian_Anwendungen_Werkzeuge"] },
	{ "Wissenschaft", Debian_menu["Debian_Anwendungen_Wissenschaft"] },
}
Debian_menu["Debian_Hilfe"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian_Spiele_Spielzeuge"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Spiele"] = {
	{ "Spielzeuge", Debian_menu["Debian_Spiele_Spielzeuge"] },
}
Debian_menu["Debian"] = {
	{ "Anwendungen", Debian_menu["Debian_Anwendungen"] },
	{ "Hilfe", Debian_menu["Debian_Hilfe"] },
	{ "Spiele", Debian_menu["Debian_Spiele"] },
}
