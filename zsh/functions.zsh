#!/bin/zsh

mksmall() {
	ffmpeg -i $1 -r 30 -s 640x480 -strict -2 $2
}

