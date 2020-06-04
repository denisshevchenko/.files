#!/bin/sh

current_layout=$(setxkbmap -query | awk '/layout:/{ print $2 }')
if [ "$current_layout" = "us" ]
then
  setxkbmap ru
else
  setxkbmap us
fi
