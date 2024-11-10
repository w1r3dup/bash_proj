#!/usr/bin/env bash

text="$1"
colour="$2"
colour_list=(0 30 31 32 33 34 35 36 37)

function print_coloured_text() {
    for (( i=0; i<=${#text}; i++ )); do
        char="${text:$i:1}"

        if [[ $i -gt 0 ]]; then
            echo -ne "\e[0m${text:0:$i}"
	fi
        echo -ne "\e[${colour}m$char"
        sleep 0.15
        echo -ne "\r"
    done

    echo

echo -ne "\033[1;37m"
}

if [[ ${text} == "--help" || ${colour} == "--help" ]]; then
	echo "usage: ./ftext.sh <text_to_output> <colour>"
	echo "colours:"
	echo "31 <- red"
	echo "32 <- green"
	echo "33 <- yellow"
	echo "34 <- blue"
	echo "35 <- purple"
	echo "36 <- cyan"
	echo "37 or 0 <- white / reset"
	echo
	echo "example: ./ftext.sh \"Hello World!\" 32"
	exit 0
fi

if [[ -z "${colour}" || ! ${colour_list[*]} =~ ${colour} ]]; then
	echo "Incorrect input, type --help for guidance"
	exit 1
else
	clear
	sleep 3
	print_coloured_text $text
	sleep 1.5
	clear
	exit 0
fi




