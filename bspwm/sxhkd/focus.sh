#!/bin/bash
# set focus follows pointer


# Get list of monitors and stash into ARRAY
M=($(bspc query -M))
bspc config pointer_follows_focus true

case $1 in
        1)
                bspc monitor -f ${M[0]}
                ;;
        2)
                bspc monitor -f ${M[1]}
                ;;
        3)
                bspc monitor -f ${M[2]}
                ;;
        4)
                bspc monitor -f ${M[3]}
		;;
        5)
                bspc monitor -f ${M[4]}
                ;;
esac
bspc config pointer_follows_focus false
