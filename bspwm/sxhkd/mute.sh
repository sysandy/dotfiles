#!/bin/bash

MUTE=$(pamixer --get-mute)

case $MUTE in

	true)
		pamixer -u
		;;
	false)
		pamixer -m
		;;

esac
