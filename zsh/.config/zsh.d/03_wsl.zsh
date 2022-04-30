# crap for WSL

if [ -v WSLENV ]; then
	case "$OLDPWD" in
		*/mnt/c/Users*)
			cd $HOME
			;;
		*/mnt/c/Windows*)
			cd $HOME
			;;
		*)
			;;
	esac
fi
