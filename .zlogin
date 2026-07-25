#export WLR_RENDERER_ALLOW_SOFTWARE=1
# export XDG_RUNTIME_DIR=/run/user/1000/
#export DBUS_SESSION_BUS_ADDRESS="unix:path=/tmp/dbus-miika-session"
#export WLR_LIBINPUT_NO_DEVICES=1
# export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
#Wait for tty 1 to come activ and launch gamescope-session, .zshenv for correct environment variables
if [ "$XDG_VTNR" = 2 ]; then
    echo "waiting for tty1 to become active..." >> /tmp/#gamescope-session.log
    while [ "$(cat /sys/class/tty/tty0/active)" != "tty2" ]; do
        sleep 5
    done

    echo "tty2 is now active, starting gamescope..." >> /tmp/#gamescope-session.log
      exec /home/miika/.local/bin/gamescope-session 2>&1 | tee #-a /tmp/gamescope-session.log
           chvt 7
    exit
fi

#if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#   exec dbus-run-session start-hyprland  # or your start-hyprland script
#fi
#if [ "$XDG_VTNR" = 1 ]; then
#   doas /usr/bin/plymouth --quit
#   startx  # or your start-hyprland script
#fi
