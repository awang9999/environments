#!/bin/bash

# Script for installing several common devtools

# Use as such:
# ./install.sh [-a]
# '-a' flag means install all apps
# Default will prompt for each app

# LIST OF DESIRED TOOLS

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
    sudo apt-get -y install cmake;
    sudo apt-get -y install libtool;

	sudo mkdir ./tmp;
		sudo wget -c https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -P ./tmp/;
	sudo zcat ./tmp/install-tl-unx.tar.gz | tar xf -;
	sudo perl ./install-tl-*/install-tl --no-interaction;
	echo "Don't forget to prepend '/usr/local/texlive/YYYY/bin/PLATFORM' to your PATH!";
}

RunWithPrompt()
{
    if confirm "Do you want to install cmake?";
    then
        sudo apt-get -y install cmake;
    fi

    if confirm "Do you want to install libtool?";
    then
        sudo apt-get -y install libtool;
    fi

	if confirm "Do you want to install TeX Live?";
	then
	    mkdir ./tmp;
		sudo wget -c https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -P ./tmp/;
		sudo zcat ./tmp/install-tl-unx.tar.gz | tar xf -;
		sudo perl ./install-tl-*/install-tl --no-interaction;
		echo "Don't forget to prepend '/usr/local/texlive/YYYY/bin/PLATFORM' to your PATH!";
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
    echo "Running interactive development tools installation script";
    RunWithPrompt
fi

echo "Development Tools installation Done!";
