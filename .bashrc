if /usr/bin/tty >/dev/null
then
	echo 'Running .profile ...'
	if [ -f ~/setup ] ; then
		. ~/setup
	fi
fi

# Needed on MacOS to remove ZSH Warming nonsense!
#export BASH_SILENCE_DEPRECATION_WARNING=1
