# Disable screen saver & DPMS
xset s 0 0
xset dpms 0 0 0


# xautolock with smart activity check
#LOCKER='i3lock -nefc 333333'
#xautolock -time 7 -notify 15 -corners '--00' -cornersize 20 -detectsleep \
#	-notifier  "xsssmart notify-send 'xautolock' 'locking in 15s'" \
#	-locker    "xsssmart -d  -p 420 $LOCKER" \
#	-nowlocker "xsssmart -dn -p 420 $LOCKER" &

