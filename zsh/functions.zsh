#!/bin/zsh

function = {
	echo "scale=4;$@" | bc -l
}


mksmall() {
	ffmpeg -i $1 -r 30 -s 640x480 -strict -2 $2
}
