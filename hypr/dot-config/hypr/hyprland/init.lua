
H = require('hyprland.helpers')

require('hyprland.monitors').apply()
require('hyprland.input').apply()
require('hyprland.keybinds').apply()
require('hyprland.decoration').apply()
require('hyprland.animations').apply()
require('hyprland.windowrules').apply()
require('hyprland.apps')


pcall(require, 'hyprland.hostname.' .. H.hostname())
pcall(require, 'hyprland.chassis.'  .. H.chassis())

