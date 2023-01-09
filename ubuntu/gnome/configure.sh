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
    echo "Syntax: ./configure [-a|None]"
    echo "Options:"
    echo "-a       Run all subconfiguration files without Y/N prompt for each one."
    echo "-h       Print this Help."
    echo "Default  Prompt at each configuration file."
}

########################
# Run Without Prompt   #
########################
RunWithoutPrompt()
{
    echo "with prompt"
}

########################
# Run With Prompt      #
########################
RunWithPrompt()
{
    echo "no prompt"
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
    echo "Running interactive configuration script";
    RunWithPrompt
fi
       



