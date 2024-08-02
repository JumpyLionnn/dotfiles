#!/usr/bin/env bash

uptime="`uptime -p | sed -e 's/up //g'`"
username="`whoami`"

# Options
shutdown='p'
reboot='r'
lock='o'
suspend='s'
logout='l'
yes='yes'
no='no'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "uppies: $uptime" \
		-mesg "uppies: $uptime" \
        -selected-row 2 \
        -kb-select-1 'o' \
        -kb-select-2 's' \
        -kb-select-3 'l' \
        -kb-select-4 'r' \
        -kb-select-5 'p' \
		-config '~/.config/rofi./power-menu.rasi' \
		-theme-str "textbox-username { content: \"$username\"; }"\
        -theme '~/.config/rofi/powermenu-style.rasi'
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 480px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg "Are you sure you want to $1?" \
        -kb-select-1 'y' \
        -kb-select-2 'n' \
		-config '~/.config/rofi/power-menu.rasi' \
        -theme '~/.config/rofi/confirmation-style.rasi'
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd $1
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -en "$lock\0icon\x1ficons/lock.png\n$suspend\0icon\x1ficons/suspend.png\n$logout\0icon\x1ficons/logout.png\n$reboot\0icon\x1ficons/reboot.png\n$shutdown\0icon\x1ficons/power.png\n" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit $1)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == 'shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == 'reboot' ]]; then
			systemctl reboot
		elif [[ $1 == 'suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == 'logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd shutdown
        ;;
    $reboot)
		run_cmd reboot
        ;;
    $lock)
		if [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
        ;;
    $suspend)
		run_cmd suspend
        ;;
    $logout)
		run_cmd logout
        ;;
esac
