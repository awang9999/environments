#! /bin/bash

# Install dconf-editor
sudo apt-install -y dconf-editor

# Move dock to bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Center dock on bottom
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Change transparency mode.
#Choose from ['FIXED', 'DEFAULT', 'DYNAMIC', 'ADAPTIVE']
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED

# Change max icon size
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

# Turn off backlit items
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false

# Hide mounted drives from dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

# Hide trash and home icons
gsettings set org.gnome.shell.extensions.ding show-home false

gsettings set org.gnome.shell.extensions.ding show-trash false
