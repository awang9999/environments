#!/bin/bash

echo "Installing Nordic Theme"

# Create .themes directory in home
mkdir ~/.themes

# Download Nordic Gnome theme into .themes directory
git clone https://github.com/EliverLara/Nordic.git ~/.themes/Nordic

# Apply Gnome settings
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"




