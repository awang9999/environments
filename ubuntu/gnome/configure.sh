#!/bin/bash

# master configuration file for gnome

# Use as such:
# ./configure.sh [-a]
# "-a" flag means run all config files
# Default will prompt at each file

#########################
# HELP                  #
#########################
Help()
{
    # Display help
    echo "Syntax: ./configure.sh [-a|None]"
    echo "Options:"
    echo "-a       Run all subconfiguration files without Y/N prompt for each one."
    echo "-h       Print this Help."
    echo "Default  Prompt at each configuration file."
}

########################
# Prompt Y/n           #
########################
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

########################
# Run Without Prompt   #
########################
RunWithoutPrompt()
{
    /bin/bash ./configure_tweaks.sh;
    /bin/bash ./configure_theme.sh;
    /bin/bash ./configure_dock.sh;
}

########################
# Run With Prompt      #
########################
RunWithPrompt()
{   
    if confirm "Do you want to install gnome-tweaks?";
    then
	/bin/bash ./configure_tweaks.sh;
    fi

    if confirm "Do you want to install Nordic theme?";
    then
	/bin/bash ./configure_theme.sh;
    fi

    if confirm "Do you want to configure dock and desktop?";
    then
	/bin/bash ./configure_dock.sh;
    fi
}

########################
# Main Program         #
########################

# Get the options
while getopts ":ah" option;
do
    case $option in
	h) # display Help
	    Help
	    exit;;
	a) # run without prompt
	    RunWithoutPrompt
	    exit;;
	\?) # Invalid option
	    echo "Error: invalid option"
	    exit;;
    esac
done

if [ $OPTIND -eq 1 ];
then
    echo "Running interactive GNOME configuration script";
    RunWithPrompt
fi

echo "GNOME Configuration Done!";
       



