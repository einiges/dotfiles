
# pkglist

- uwsm
- hyprland
- hypridle (enable systemd unit: hypridle)
- hyprlock
- hyprpaper
- nwg-display
- nwg-look
- _kanshi_

## Screenshots

- grim
- slurp

- wl-clipboard

## audio control

- playerctl (enable systemd unit, see below: playerctld)
- mpd-mpris (enable systemd unit: mpd-mpris)
- mpv-mpris

- brightnessctl

## setup

~/.config/systemd/user/playerctld.service
```
[Unit]
Description=Keep track of media player activity

[Service]
ExecStart=/usr/bin/playerctld

[Install]
WantedBy=default.target
```


