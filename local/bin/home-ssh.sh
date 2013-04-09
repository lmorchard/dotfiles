#!/bin/sh
dns-sd -P "secret tunnel to tank" _daap._tcp local 3689 localhost 127.0.0.1 "Arbitrary text record" &
PID=$!
#autossh -M25001 -D9999 -C -t home /opt/bin/screen -dR
#autossh -M25001 -D9999 -C -t home /opt/bin/tmux attach
autossh -M25001 -D9999 -C -t home
kill $PID
