#!/bin/sh

MONITOR=${1:-0}

GEOMETRY=( $(herbstclient monitor_rect "${MONITOR}") )
X=${GEOMETRY[0]}
Y=${GEOMETRY[1]}
W=${GEOMETRY[2]}
H=20

herbstclient pad $MONITOR $H

FONT="Source Code Pro-9"
FONT_ICONS="FontAwesome-10"



# -- Colors --

BLACK='#FF000000'
WHITE='#FFFFFFFF'
GRAY='#FF82898B'
RED='#FFFF0000'
ICONCOLOR="#FF777777"
ISPACER="%{O8}"
SPACER="%{O20}"

# $( colorize fontcolor text )
colorize() {
	echo "%{F$1}$2%{F-}"
}

# $( underline linecolor text [text [...]] )
underline() {
	echo "%{+u}%{U$1}${@:2}%{U-}%{-u}"
}

# $( overline linecolor text [text [...]] )
overline() {
	echo "%{+o}%{U$1}${@:2}%{U-}%{-o}"
}



# -- Icons --

# $( ppIconNoOffset key [color] )
ppIconNoOffset() {
	local icon=""

	case $1 in
		building     )  icon="\uf0f7" ;;     # 
		calendar     )  icon="\uf073" ;;     # 
		clock        )  icon="\uf017" ;;     # 
		code         )  icon="\uf121" ;;     # 
		cubes        )  icon="\uf1b3" ;;     # 
		firefox      )  icon="\uf269" ;;     # 
		globe        )  icon="\uf0ac" ;;     # 
		headphones   )  icon="\uf025" ;;     # 
		home         )  icon="\uf015" ;;     # 
		mail         )  icon="\uf003" ;;     # 
		microchip    )  icon="\uf2db" ;;     # 
		power        )  icon="\uf011" ;;     # 
		square       )  icon="\uf096" ;;     # 
		squarefilled )  icon="\uf0c8" ;;     # 
		terminal     )  icon="\uf120" ;;     # 
		user         )  icon="\uf2c0" ;;     # 
		volumehigh   )  icon="\uf028" ;;     # 
		volumelow    )  icon="\uf027" ;;     # 
		volumeoff    )  icon="\uf026" ;;     # 
		*            )  icon="?"      ;;
	esac

	if [ -z $2 ]; then
		echo "$icon"
	else
		echo "$(colorize $2 $icon)"
	fi
}

# $( ppIcon key [color] )
ppIcon() {
	echo "$(ppIconNoOffset $1 $2)${ISPACER}"
}



# -- Pretty printer --


# $( ppUser )
ppUser() {
	local cmd=${USER}
	local icon=$(ppIcon user $ICONCOLOR)
	echo "${icon}${cmd}"
}


# $( ppHostname )
ppHostname() {
	local cmd=$(hostname)
	local icon=$(ppIcon home $ICONCOLOR)
	echo "${icon}${cmd}"
}


# $( ppLocalIp )
ppLocalIp() {
	local cmd=$(ip a | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d\/ | xargs printf "%.15s")
	local icon=$(ppIcon building $ICONCOLOR)
	echo -n "%{A:herbstclient emit_hook publicip:}"
	echo -n   "%{A3:herbstclient emit_hook localip:}"
	echo -n     "${icon}${cmd}"
	echo -n   "%{A}"
	echo    "%{A}"
}


# $( ppPublicIp )
ppPublicIp() {
	local cmd=$(curl -s https://ipinfo.io/ip | xargs printf "%.15s")
	local icon=$(ppIcon globe $ICONCOLOR)
	echo -n "%{A:herbstclient emit_hook localip:}"
	echo -n   "%{A3:herbstclient emit_hook publicip:}"
	echo -n     "${icon}${cmd}"
	echo -n   "%{A}"
	echo    "%{A}"
}


# $( ppTitle title )
ppTitle() {
	head -c 50 <<< $1
}


# $( ppDay )
ppDay() {
	#                            %a,       %d.           %b
	local cmd=$(date "+%%{F$GRAY}%a, %%{F-}%d. %%{F$GRAY}%b%%{F-}")
	local icon=$(ppIcon calendar "$ICONCOLOR")
	echo ${icon}${cmd}
}


# $( ppClock )
ppClock() {
	#                  %H          :      %M
	local cmd=$(date "+%H%%{F$GRAY}:%%{F-}%M")
	local icon=$(ppIcon clock $ICONCOLOR)
	echo "${icon}${cmd}"
}


# $( ppSong )
ppSong() {
	local cmd=$(mpc current --format '%title%' | head -c 30)
	local icon=$(colorize $ICONCOLOR $(ppIcon headphones))

	echo -n "%{A2:mpd --kill && mpd && herbstclient emit_hook mpd:}"
	echo -n   "%{A:mpc -q toggle:}"
	echo -n     "${icon}${cmd}"
	echo -n   "%{A}"
	echo    "%{A}"
}


# $( ppVolume )
ppVolume() {
	local cmd=$(amixer -M get Master | tail -1 | sed 's/.*\[\([0-9]*\)\%\].*/\1/' | xargs printf "%-4s")

	if [ $cmd -ge 75 ]; then
		icon=$(ppIcon volumehigh)
	elif [ $cmd -ge 25 ]; then
		icon=$(ppIcon volumelow)
	else
		icon=$(ppIcon volumeoff)
	fi

	# muted?
	if $(amixer get Master | grep -q off); then
		icon=$(colorize $RED $icon)
	else
		icon=$(colorize $ICONCOLOR $icon)
	fi

	echo -n "%{A:amixer -q set Master toggle:}"
	echo -n   "${icon}${cmd}"
	echo    "%{A}"
}


# $( ppMpdVolume )
ppMpdVolume() {
	local cmd=$(mpc volume | sed 's/.*: *\([0-9]*\)\%/\1/' | xargs printf "%-3s")

	echo "${cmd}"
}


# $( ppCpu usage )
ppCpu() {
	local cmd=$(printf "%-3s" $1)
	local icon=$(ppIcon squarefilled "$ICONCOLOR")
	echo "${icon}${cmd}"
}


# $( ppMemory )
ppMemory() {
	local cmd=$(free -m | grep Mem | awk '{print $3 }')
	local icon=$(ppIcon microchip "$ICONCOLOR")
	local unit=$(colorize $GRAY M)
	echo "${icon}${cmd}${unit}"
}


# $( ppTags )
ppTags() {
	local cmd=( $(herbstclient tag_status $MONITOR) )
	for tag in "${cmd[@]}"; do
		local icon=""
		local color=""

		case ${tag:0:1} in

			# # tag is viewed on MONITOR and is focused
			# % tag is viewed on different MONITOR and is focused
			'#' | '%')
				icon=$(ppIconNoOffset squarefilled)
				color="#5F98FF"
				;;

			# : tag is not empty)
			':')
				icon=$(ppIconNoOffset squarefilled)
				color="#383838"
				;;

			# ! tag contains urgent window
			'!')
				icon=$(ppIconNoOffset squarefilled)
				color="#ff8800"
				;;

			# - tag is viewed on different MONITOR, but this monitor is not focused
			# + tag is viewed on MONITOR, but this monitor is not focused
			'-' | '+')
				icon=$(ppIconNoOffset squarefilled)
				color="#2B6034"
				;;

			# . tag is empty
			'.' )
				icon=$(ppIconNoOffset square)
				color="#383838"
				;;

			# some new unknown stuff?
			* )
				icon="?"
				color="#cc0000"
				;;
		esac

		echo -n "${ISPACER}$(colorize $color $icon)${ISPACER}"
	done

}


{
# -- Event generator --

	# Loops are responding after first sleep,
	# cause of, herbstclient starts idling after
	# setting up the loop. This results in not 
	# generated events at start.

	# Process IDs
	declare -a pids

	mpc idleloop player mixer &
	pids[0]=$!


	stdbuf -oL alsactl monitor &
	pids[1]=$!


	conky -c $XDG_CONFIG_HOME/herbstluftwm/conky.conf &
	pids[2]=$!


	while :; do
		# 5 Seconds past each minute change
		sleep $(( $(date '+65-%S') )) || break

		herbstclient emit_hook clock
	done &
	pids[3]=$!


	while :; do
		# 86400s = 24 * 60 * 60s   # Seconds in a day
		#  3600s = 60 * 60s        # Seconds in an hour
		# 1 minute past midnight
		sleep $(( $(date '+86460-(%H*3600+%M*60+%S)') )) || break

		herbstclient emit_hook day
	done &
	pids[4]=$!


	while :; do
		sleep 5 || break

		herbstclient emit_hook memory
	done &
	pids[5]=$!

	herbstclient --idle


	kill ${pids[@]}


} 2> /dev/null | {

# -- Initializer --

	tags=$(ppTags)
	hostname=$(ppHostname)
	user=$(ppUser)
	windowtitle=""
	day=$(ppDay)
	clock=$(ppClock)
	memory=$(ppMemory)
	song=$(ppSong)
	volume=$(ppVolume)
	mpdvolume=$(ppMpdVolume)
	ip=$(ppLocalIp)

	# Loops once through event handler
	herbstclient emit_hook init

# -- Event handler --

	while :; do

		# Wait for events
		IFS=$'\t' read -ra cmd || break

		# Event origin
		case "${cmd[0]}" in
			tag* )
				tags=$(ppTags)
				;;

			quit_panel )
				exit
				;;

			reload )
				exit
				;;

			focus_changed | window_title_changed )
				windowtitle=$(ppTitle "${cmd[@]:2}")
				;;

			day )
				day=$(ppDay)
				;;

			clock )
				clock=$(ppClock)
				;;

			player )
				song=$(ppSong)
				;;

			mixer )
				mpdvolume=$(ppMpdVolume)
				;;

			mpd )
				song=$(ppSong)
				mpdvolume=$(ppMpdVolume)
				;;

			card* )
				volume=$(ppVolume)
				;;

			cpu_usage )
				cpu=$(ppCpu "${cmd[@]:1}")
				;;

			memory )
				memory=$(ppMemory)
				;;

			host )
				hostname=$(ppHostname)
				;;

			user )
				user=$(ppUser)
				;;

			localip )
				ip=$(ppLocalIp)
				;;

			publicip )
				ip=$(ppPublicIp)
				;;

			* )
				continue
				;;

		esac

		echo -en "%{l}${SPACER}${user}${SPACER}${hostname}${SPACER}${ip}${SPACER}${windowtitle}"
		echo -en "%{c}${tags}"
		echo -e  "%{r}${song}${SPACER}${volume} ${mpdvolume}${SPACER}${cpu}${SPACER}${memory}${SPACER}${day}${SPACER}${clock}${SPACER}"
	done

} | lemonbar -g ${W}x${H}+${X}+${Y} -B $BLACK -F $WHITE -u 2 -o -2 -f "$FONT" -o -3 -f "$FONT_ICONS" | sh > /dev/null 2>&1



