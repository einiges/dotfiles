
config.bind('<Ctrl-T>', 'set-cmd-text -r -s :tab-focus')
config.bind('T', 'set-cmd-text -s :open -t')
config.bind('(', 'tab-prev')
config.bind(')', 'tab-next')
config.bind('<', 'back')
config.bind('>', 'forward')
config.bind('[', 'tab-move -')
config.bind(']', 'tab-move +')
config.bind('{{', 'navigate prev')
config.bind('}}', 'navigate next')
config.bind('{}', 'navigate prev -t')
config.bind('}{', 'navigate next -t')
config.bind('{-', 'navigate decrement')
config.bind('}+', 'navigate increment')

config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave ;; clear-messages')

config.unbind('gf')
config.bind('gs', 'view-source')

config.bind(';m', 'hint links spawn mpv {hint-url}')
config.bind(';M', 'spawn mpv {url}')

config.bind('<Left>', 'scroll left')
config.bind('<Down>', 'scroll down')
config.bind('<Up>', 'scroll up')
config.bind('<Right>', 'scroll right')
config.bind('<Home>', 'scroll-to-perc 0')
config.bind('<End>', 'scroll-to-perc')
config.bind('<PgUp>', 'scroll-page 0 -1')
config.bind('<PgDown>', 'scroll-page 0 1')

config.unbind('m')
config.bind('mb', 'bookmark-add')
config.bind('mdb', 'set-cmd-text -s :bookmark-del')
config.bind('mq', 'quickmark-save')
config.bind('mdq', 'set-cmd-text -s :quickmark-del')

config.bind('<Shift-Return>', 'open-editor', mode='insert')

