from themes.onedark import set_theme
from qutebrowser.api import interceptor
from adblock_list import adblock_list
import os

set_theme(c)
config.load_autoconfig()

c.backend = 'webengine'
c.content.cookies.accept = 'no-3rdparty'
c.content.blocking.method = 'both'
c.new_instance_open_target = 'window'
c.editor.command = ['urxvt -e vim {}']

c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

c.downloads.location.directory = '~/Downloads'
c.downloads.location.prompt = True
c.downloads.remove_finished = 0

c.statusbar.position = 'top'

c.fonts.default_family = "12px 'Hack Nerd Font Mono'"
c.fonts.default_size = '12pt'
c.fonts.completion.category = f"bold {c.fonts.default_family}"
c.fonts.completion.entry = c.fonts.default_family
c.fonts.debug_console = c.fonts.default_family
c.fonts.downloads = c.fonts.default_family
c.fonts.keyhint = c.fonts.default_family
c.fonts.messages.error = c.fonts.default_family
c.fonts.messages.info = c.fonts.default_family
c.fonts.messages.warning = c.fonts.default_family
c.fonts.prompts = c.fonts.default_family
c.fonts.statusbar = c.fonts.default_family
c.fonts.hints = "bold 13px 'DejaVu Sans Mono'"

c.auto_save.session = True
c.url.searchengines = {'DEFAULT': 'https://google.com/?q={}'}

c.content.blocking.adblock.lists = adblock_list

# Toggle statusbar and tabs
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

c.editor.command = [
    os.environ['TERMINAL'],
    '-e',
    os.environ['EDITOR'],
    '-f',
    '{file}',
    '-c',
    'normal {line}G{column0}1',
]
config.bind('<Ctrl-h>', 'fake-key <Backspace>', 'insert')
config.bind('<Ctrl-a>', 'fake-key <Home>', 'insert')
config.bind('<Ctrl-e>', 'fake-key <End>', 'insert')
config.bind('<Ctrl-b>', 'fake-key <Left>', 'insert')
config.bind('<Mod1-b>', 'fake-key <Ctrl-Left>', 'insert')
config.bind('<Ctrl-f>', 'fake-key <Right>', 'insert')
config.bind('<Mod1-f>', 'fake-key <Ctrl-Right>', 'insert')
config.bind('<Ctrl-p>', 'fake-key <Up>', 'insert')
config.bind('<Ctrl-n>', 'fake-key <Down>', 'insert')
config.bind('<Mod1-d>', 'fake-key <Ctrl-Delete>', 'insert')
config.bind('<Ctrl-d>', 'fake-key <Delete>', 'insert')
config.bind('<Ctrl-w>', 'fake-key <Ctrl-Backspace>', 'insert')
config.bind('<Ctrl-u>', 'fake-key <Shift-Home><Delete>', 'insert')
config.bind('<Ctrl-k>', 'fake-key <Shift-End><Delete>', 'insert')
config.bind('<Ctrl-x><Ctrl-e>', 'open-editor', 'insert')
