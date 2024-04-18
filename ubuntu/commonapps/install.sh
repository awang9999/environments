#!/bin/bash

# Script for installing several common applications

# Use as such:
# ./install.sh [-a]
# '-a' flag means install all apps
# Default will prompt for each app

# LIST OF DESIRED APPLICATIONS
# - Discord
# - Zoom
# - VLC Media Player
# - KdenLive
# - Inkscape
# - Chromium
# - Firefox
# - Handbrake
# - Blender
# - Gimp
# - OBS-Studio
# - Libreoffice
# - Neofetch
# - Minecraft
# - Alacritty

Help()
{
    # Display help
    echo "Syntax: ./install.sh [-options]"
    echo "Options:"
    echo "-a        Install all apps"
    echo "-h        Print this Help."
    echo "Default   Prompt for each app"
}

confirm()
{
    local _prompt _default _response

    if [ "$1" ];
    then
	_prompt="$1 (Y/n)";
    else
	_prompt="Are you sure? (Y/n)";
    fi

    # Loop forever until the user enters valid response (Y/N or Yes/No)

    while true; do
	read -r -p "$_prompt " _response
	case "$_response" in
	    [Yy][Ee][Ss]|[Yy]) #Yes or Y (case insensitive).
		return 0
		;;
	    [Nn][Oo]|[Nn]) # No or N
		return 1
		;;
	    "")
		return 0
		;;
	    *) # Anything else (including blank is invalid.
		;;
	esac
    done
}

RunWithoutPrompt()
{
    sudo snap install discord;
    sudo snap install zoom-client;
    sudo snap install vlc;
    sudo snap install kdenlive;
    sudo snap install inkscape;
    sudo snap install chromium;
    sudo snap install firefox;
    sudo snap install handbrake-jz;
    sudo snap install blender --classic;
    sudo snap install gimp;
    
    sudo snap install obs-studio;
    sudo snap connect obs-studio:alsa;
    sudo snap connect obs-studio:audio-record;
    sudo snap connect obs-studio:avahi-control;
    sudo snap connect obs-studio:camera;
    sudo snap connect obs-studio:jack1;
    sudo snap connect obs-studio:kernel-module-observe;
    sudo snap connect obs-studio:removable-media;
    
    sudo snap install libreoffice;
    sudo snap install thunderbird;
    sudo apt-get install -y neofetch;
    sudo snap install mc-installer;
    sudo snap install slack;
    sudo apt-get install -y tree;
}

RunWithPrompt()
{
    if confirm "Do you want to install Discord?";
    then
	sudo snap install discord;
    fi

    if confirm "Do you want to install Zoom?";
    then
	sudo snap install zoom-client;
    fi

    if confirm "Do you want to install VLC Media Player?";
    then
	sudo snap install vlc;
    fi

    if confirm "Do you want to install KdenLive?";
    then
	sudo snap install kdenlive;
    fi

    if confirm "Do you want to install Inkscape?";
    then
	sudo snap install inkscape;
    fi

    if confirm "Do you want to install Chromium?";
    then
	sudo snap install chromium;
    fi

    if confirm "Do you want to install Firefox?";
    then
	sudo snap install firefox;
    fi

    if confirm "Do you want to install Handbrake?";
    then
	sudo snap install handbrake-jz;
    fi

    if confirm "Do you want to install Blender?";
    then
	sudo snap install blender --classic;
    fi

    if confirm "Do you want to install Gimp?";
    then
	sudo snap install gimp;
    fi

    if confirm "Do you want to install Obs-Studio?";
    then
	sudo snap install obs-studio;
	sudo snap connect obs-studio:alsa;
	sudo snap connect obs-studio:audio-record;
	sudo snap connect obs-studio:avahi-control;
	sudo snap connect obs-studio:camera;
	sudo snap connect obs-studio:jack1;
	sudo snap connect obs-studio:kernel-module-observe;
	sudo snap connect obs-studio:removable-media;
    fi

    if confirm "Do you want to install Libreoffice?";
    then
	sudo snap install libreoffice;
    fi

    if confirm "Do you want to install Thunderbird?";
    then
	sudo snap install thunderbird;
    fi

    if confirm "Do you want to install Neofetch?";
    then
	sudo apt-get install -y neofetch;
    fi

    if confirm "Do you want to install Minecraft?";
    then
	sudo snap install mc-installer;
    fi

    if confirm "Do you want to install Slack?";
    then
	sudo snap install slack;
    fi

    if confirm "Do you want to install tree?";
    then
	sudo apt-get install -y tree;
    fi
}



while getopts ":ah" option;
do
    case $option in
	h) # display help
	    Help
	    exit;;
	a) # run all
	    RunWithoutPrompt
	    exit;;
	\?) # Invalid option
	    echo "Error: invalid option"
	    exit;;
    esac
done

if [ $OPTIND -eq 1 ];
then
    echo "Running interactive common application installation script";
    RunWithPrompt
fi

echo "Common applications installation Done!";

















	    
