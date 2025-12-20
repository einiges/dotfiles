hash -d down=~/Downloads
hash -d docs=~/Documents
hash -d audio=~/Audio
hash -d music=~/Audio/Music
hash -d radio=~/Audio/RadioPlay
hash -d wall=~/Pictures/Wallpapers
hash -d shots=~/Pictures/Screenshots
hash -d media=/run/media/"${USER}"
hash -d ws=~/Workspace
hash -d dots=~/.dotfiles

hash -d config="${XDG_CONFIG_HOME:-$HOME/.config}"
hash -d cache="${XDG_CACHE_HOME:-$HOME/.cache}"
hash -d data="${XDG_DATA_HOME:-$HOME/.local/share}"
hash -d bin="${HOME}/.local/bin"
hash -d state="${XDG_STATE_HOME:-$HOME/.local/state}"

