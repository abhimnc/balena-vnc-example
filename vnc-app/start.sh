#!/bin/bash
# Xvfb :unix$DISPLAY -screen 0 1024x768x24 >& /dev/null & export DISPLAY=:unix$DISPLAY;

# python3 /etc/supervisor/camera_app.py
export XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR


export DISPLAY=:0
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

if [ -z ${VNC_PASS} ]; then
  echo "STARTING VNC WITHOUT PASSWORD"
  echo "STARTING X"
  startx
  supervisord -c /etc/supervisor/supervisord_np.conf  
else
  echo "STARTING VNC WITH PASSWORD"
  echo "STARTING X"
  startx
  supervisord -c /etc/supervisor/supervisord.conf
fi