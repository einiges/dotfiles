config.source('colors/solarized_light.py')
config.source('themes/my.py')
config.source('bindings.py')

c.auto_save.session = True

c.completion.cmd_history_max_items = 30
c.completion.delay = 100
c.completion.height = '30%'
c.completion.shrink = True
c.completion.timestamp_format = '%d %m %Y'

c.confirm_quit = ['downloads']

c.content.autoplay = False
c.content.default_encoding = 'utf-8'
c.content.desktop_capture = False
c.content.geolocation = False
c.content.headers.accept_language = 'en-US,en,de-DE,de'
c.content.headers.referer = 'never'
#c.content.host_blocking.list = []
c.content.host_blocking.whitelist = []
c.content.mouse_lock = False
c.content.print_element_backgrounds = False
c.content.webgl = False

c.downloads.location.directory = '~/Downloads'
c.downloads.location.prompt = False
c.downloads.open_dispatcher = 'rifle'
c.downloads.position = 'bottom'
c.downloads.remove_finished = 2500

c.editor.command = ['terminal', '-e', 'nvim', '+call cursor({line}, {column0})', '{file}']

c.hints.chars = 'uiaenrtd'
c.hints.next_regexes += [r'\bweiter\b', r'\bnächste(r|s)?\\b', r'\bneuer\b', r'\bmehr\b']
c.hints.prev_regexes += [r'\bzurück\b', r'\bvorher(ig(e|er|es)?)?\\b', r'\bälter\b', r'\bweniger\b']

c.input.partial_timeout = 0
c.messages.timeout = 5000
c.prompt.radius = 0
c.scrolling.bar = 'always'
c.scrolling.smooth = True
c.session.lazy_restore = True
c.statusbar.widgets = ['progress', 'keypress', 'url', 'scroll']

c.tabs.background = True
c.tabs.title.format = '{audio}{index}{title_sep}{perc}{title}'
c.tabs.last_close = 'startpage'
c.tabs.show = 'multiple'

c.url.default_page = "about:blank"
c.url.start_pages = c.url.default_page
c.url.searchengines = {
    'DEFAULT': 'https://new.startpage.com/do/asearch?q={}',
    'sp':      'https://new.startpage.com/do/asearch?q={}&cat=pics&nj=0',
    'a':       'https://www.amazon.de/s/keyword={}',
    'aw':      'https://wiki.archlinux.org/index.php/{}',
    'd':       'https://dict.cc/?s={}',
    'osm':     'https://openstreetmap.org/search?query={}',
    'w':       'https://en.wikipedia.org/wiki/{}',
    'yt':      'https://www.youtube.com/results?search_query={}',
}

c.window.title_format = '{host}{title_sep}{title} - qutebrowser'

