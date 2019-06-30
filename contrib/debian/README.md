
Debian
====================
This directory contains files used to package bolivarcoind/bolivarcoin-qt
for Debian-based Linux systems. If you compile bolivarcoind/bolivarcoin-qt yourself, there are some useful files here.

## bolivarcoin: URI support ##


bolivarcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bolivarcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bolivarcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/bolivarcoin128.png` to `/usr/share/pixmaps`

bolivarcoin-qt.protocol (KDE)

