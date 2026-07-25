# gamescopesession
Setup gamescope session on Linux / Artix Linux

### Wakeup lg tv

### Wakeup from sleep with controller
lsusb to check the device 
sudo vim /etc/udev/rules.d/10-wakeup.rules
```ACTION=="add|change", SUBSYSTEM=="usb", KERNEL=="usb3", ENV{DEVTYPE}=="usb_device", ATTR{power/wakeup}="enabled"
```
to make sure computer does not wakeup from sleep when controller turns off
edit add script called steamos to ```/usr/lib/elogind/system-sleep``` 
