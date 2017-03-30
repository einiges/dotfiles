#!/bin/sh

MONITOR=${1:-0}

GEOMETRY=( $(herbstclient monitor_rect "${MONITOR}") )
X=${GEOMETRY[0]}
Y=${GEOMETRY[1]}
W=${GEOMETRY[2]}
H=16

herbstclient pad $MONITOR $H 

FONT="Source Code Pro-9"
FONT_ICONS="FontAwesome-10"



# -- Colors --

BLACK='#FF000000'
WHITE='#FFFFFFFF'
GRAY='#FF82898B'
RED='#FFFF0000'
ICONCOLOR="#FF777777"

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

# $( ppIconNoOffset key)
ppIconNoOffset() {
	case $1 in
		at           )  echo "\uf1fa" ;;     # 
		building     )  echo "\uf0f7" ;;     # 
		calendar     )  echo "\uf133" ;;     #  
		circle       )  echo "\uf1db" ;;     # 
		circlefilled )  echo "\uf111" ;;     #  
		clock        )  echo "\uf017" ;;     # 
		code         )  echo "\uf121" ;;     # 
		cubes        )  echo "\uf1b3" ;;     # 
		dot          )  echo "•"      ;;
		firefox      )  echo "\uf269" ;;     # 
		globe        )  echo "\uf0ac" ;;     # 
		headphones   )  echo "\uf025" ;;     # 
		mail         )  echo "\uf003" ;;     # 
		microchip    )  echo "\uf2db" ;;     # 
		paused       )  echo "\uf04c" ;;     # 
		playing      )  echo "\uf04b" ;;     # 
		power        )  echo "\uf011" ;;     # 
		squarefilled )  echo "\uf0c8" ;;     # 
		square       )  echo "\uf096" ;;     # 
		stop         )  echo "\uf04d" ;;     # 
		terminal     )  echo "\uf120" ;;     # 
		user         )  echo "\uf2c0" ;;     # 
		volumehigh   )  echo "\uf028" ;;     # 
		volumelow    )  echo "\uf027" ;;     # 
		volumeoff    )  echo "\uf026" ;;     # 
		*            )  echo "?"      ;;
	esac
}

# $( ppIcon key )
ppIcon() {
	echo "$(ppIconNoOffset $1)%{O5}"
}



# -- Pretty printer --

ppUser() {
	local cmd=${USER}
	local icon=$(colorize $ICONCOLOR $(ppIcon user))
	echo "${icon}${cmd}"
}


ppHostname() {
	local cmd=$(hostname)
	local icon=$(colorize $ICONCOLOR $(ppIcon at))
	echo "${icon}${cmd}"
}


ppLocalIp() {
	local cmd=$(ip a | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d\/ | xargs printf "%.15s")
	local icon=$(colorize $ICONCOLOR $(ppIcon building))
	echo "%{A:herbstclient emit_hook publicip:}" \
		     "%{A3:herbstclient emit_hook localip:}" \
		       "${icon}${cmd}" \
		     "%{A}" \
		   "%{A}"
}


ppPublicIp() {
	local cmd=$(curl -s https://ipinfo.io/ip | xargs printf "%.15s")
	local icon=$(colorize $ICONCOLOR $(ppIcon globe))
	echo "%{A:herbstclient emit_hook localip:}" \
	       "%{A3:herbstclient emit_hook publicip:}" \
	         "${icon}${cmd}" \
	       "%{A}" \
	     "%{A}"
}


# $( ppTitle title )
ppTitle() {
	head -c 50 <<< $1
}


ppDay() {
	#                            %a,       %d.           %b
	local cmd=$(date "+%%{F$GRAY}%a, %%{F-}%d. %%{F$GRAY}%b%%{F-}")
	local icon=$(colorize $ICONCOLOR $(ppIcon calendar))
	echo ${icon}${cmd}
}


ppClock() {
	#                 #%H          :      %M
	local cmd=$(date "+%H%%{F$GRAY}:%%{F-}%M")
	local icon=$(colorize $ICONCOLOR $(ppIcon clock))
	echo "${icon}${cmd}"
}


ppSong() {
	local cmd=$(mpc current --format '%title%' | head -c 30)
	local icon=$(colorize $ICONCOLOR $(ppIcon headphones))
	local icon2=""

	#if $(mpc | grep -q paused); then
	#	icon2=$(ppIcon paused)
	#else
	#	icon2=$(ppIcon playing)
	#fi

	echo "%{A2:mpd --kill && mpd && herbstclient emit_hook mpd:}" \
		     "%{A:mpc -q toggle:}" \
		       "${icon}${cmd}" \
		     "%{A}" \
		   "%{A}"
}


ppVolume() {
	local cmd=$(amixer -M get Master | tail -1 | sed 's/.*\[\([0-9]*\)\%\].*/\1/' | xargs printf "%3s")
	local icon=""

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

	echo "%{A:amixer -q set Master toggle:}" \
		     "${icon}${cmd}" \
		   "%{A}"
}


ppMpdVolume() {
	local cmd=$(mpc volume | sed 's/.*: *\([0-9]*\)\%/\1/' | xargs printf "%3s")

	echo "${cmd}"
}


# TODO Find better solution.
ppCpu() {
	local cmd=$(ps -A -o pcpu | tail -n+2 | paste -sd+ | bc )
	local icon=$(colorize $ICONCOLOR $(ppIcon squarefilled))
	echo "${icon}${cmd}"
}


ppMemory() {
	local cmd=$(free -m | grep Mem | awk '{print $3 }')
	local icon=$(ppIcon microchip)
	local unit=$(colorize $GRAY M)
	echo "${icon}${cmd}${unit}"
}


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

		echo -n "%{O8}$(colorize $color $icon)%{O8}"
	done

}


{
# -- Event generator --

	# Loops are responsing after first sleep,
	# cause of, herbstclient starts idling after
	# setting up the loop. This results in not 
	# generated events at start.

	# Process IDs
	declare -a pids

	mpc idleloop player mixer &
	pids[0]=$!


	stdbuf -oL alsactl monitor &
	pids[1]=$!


	while :; do
		# 5 Seconds past each minute change
		sleep $(( $(date '+65-%S') )) || break

		herbstclient emit_hook clock
	done &
	pids[2]=$!


	while :; do
		# 86400s = 24 * 60 * 60s   # Seconds in a day
		#  3600s = 60 * 60s        # Seconds in an hour
		# 1 minute past midnight
		sleep $(( $(date '+86460-(%H*3600+%M*60+%S)') )) || break

		herbstclient emit_hook day
	done &
	pids[3]=$!


	while :; do
		sleep 5 || break

		herbstclient emit_hook hardware
	done &
	pids[4]=$!


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
	cpu=$(ppCpu)
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

			hardware | cpu | memory )
				memory=$(ppMemory)
				cpu=$(ppCpu)
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

		esac

		echo -en "%{l}${user} ${hostname} ${ip} ${windowtitle}"
		echo -en "%{c}${tags}"
		echo -e  "%{r}${song} ${volume} ${mpdvolume} ${cpu} ${memory} ${day} ${clock} "
	done

} | lemonbar -g ${W}x${H}+${X}+${Y} -B $BLACK -F $WHITE -o -2 -f "$FONT" -o -3 -f "$FONT_ICONS" | sh > /dev/null 2>&1



