# gamescopesession
Setup gamescope session on Linux / Artix Linux Use Dinit for artix for best results

### Setting up right launch parameters to steambig picture work in another tty
`.local/bin/` folder has needed scripts to gamescopes session work also you need to use included
`.zlogin` for it launch the session when tty is 2

### Wakeup lg tv
wakeonlan works but shutting down is harder
you bscpylgtvcommand
`/var/lib/lgtv` folder to be writable you need to file called `.aiopylgtv.sqlite` in there to be able run bscpylgtv commands

-- Use elogind systemshutdown to invoke shutdown tv when shutting down pc using bscpylgtvcommand,
you need to make folder `/var/lib/lgtv/` and `chmod +x 777 lgtv` folder,
and copy `faiopylgtv.sqlite` from home folder there after you have once ran bscpylgtvcommand
on your home to get permissions
add 10-tv-off to so TV turn off after powering off the computer
```/usr/lib/elogind/system-shutdown/10-tv-off```

### Wakeup from sleep with controller
lsusb to check the device 
`sudo vim /etc/udev/rules.d/10-wakeup.rules`
```
ACTION=="add|change", SUBSYSTEM=="usb", KERNEL=="usb3", ENV{DEVTYPE}=="usb_device", ATTR{power/wakeup}="enabled"
```
to make sure computer does not wakeup from sleep when controller turns off
edit add script called steamos to ```/usr/lib/elogind/system-sleep``` 

script will use bscpylgtvcommand to power off the tv when computer goes to sleep, and if tty2 is active when computer wakes from sleep it will power on tv over wakeonlan

### Powering off so tv shutsdown when computer powers off
add script called 30-tv-off to
`/usr/lib/elogind/system-shutdown` also add close_brave if you want to close brave so it doesn't give errors when you power on pc again
