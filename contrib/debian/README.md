
Debian
====================
This directory contains files used to package bytnd/bytn-qt
for Debian-based Linux systems. If you compile bytnd/bytn-qt yourself, there are some useful files here.

## bytn: URI support ##


bytn-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bytn-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bytn-qt binary to `/usr/bin`
and the `../../share/pixmaps/bytn128.png` to `/usr/share/pixmaps`

bytn-qt.protocol (KDE)

