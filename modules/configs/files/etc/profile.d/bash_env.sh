#!/bin/bash

#Black       0;30     Dark Gray     1;30
#Blue        0;34     Light Blue    1;34
#Green       0;32     Light Green   1;32
#Cyan        0;36     Light Cyan    1;36
#Red         0;31     Light Red     1;31
#Purple      0;35     Light Purple  1;35
#Brown       0;33     Yellow        1;33
#Light Gray  0;37     White         1;37

BLUE="\e[0;34m"
IBLUE="\e[1;34m"
GREEN="\e[0;32m"
RESET="\e[0m"

# For insert roles list
#PS1="\[$BLUE\]\A /\[$IBLUE\]TEXT/ \[$RESET\]\[$GREEN\]\u@\h \[$GREEN\]\W \\$ \[$RESET\]"

PS1="\[$BLUE\]\A \[$RESET\]\[$GREEN\]\u@\h \[$GREEN\]\W \\$ \[$RESET\]"
export PS1
