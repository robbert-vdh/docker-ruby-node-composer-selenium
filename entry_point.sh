#!/bin/bash

export DISPLAY=:99
nohup Xvfb :99 -shmem -screen 0 1366x768x16 > /dev/null 2>&1 &
nohup x11vnc -passwd secret -display :99 -N -forever > /dev/null 2>&1 &

# selenium must be started by a non-root user otherwise chrome can't start
su - seleuser -c "selenium-standalone start"
