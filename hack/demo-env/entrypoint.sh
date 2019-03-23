#!/bin/sh

dockerdCmd="dockerd -s overlay2 -D"

if [ -n "$TMUX_ENTRYPOINT" ]; then
  tmux new -s demo -d
  tmux new-window "$dockerdCmd"
  tmux new-window
  tmux a -t demo
else
  ( $dockerdCmd 2>/var/log/dockerd.log & )
  exec sh
fi




