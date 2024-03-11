#!/bin/bash
# Xvfb :unix$DISPLAY -screen 0 1024x768x24 >& /dev/null & export DISPLAY=:unix$DISPLAY;

# python3 /etc/supervisor/camera_app.py


if [ -z ${VNC_PASS} ]; then
  echo "STARTING VNC WITHOUT PASSWORD"
  supervisord -c /etc/supervisor/supervisord_np.conf  
else
  echo "STARTING VNC WITH PASSWORD"
  supervisord -c /etc/supervisor/supervisord.conf
fi