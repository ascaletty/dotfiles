import os
import tomllib
config.load_autoconfig()

c.colors.webpage.preferred_color_scheme= 'dark'
config.bind('<Ctrl+/>', 'hint links spawn --detach mpv {hint-url}')

config.bind('<z><l>', 'spawn --userscript qute-pass')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only')
config.bind('<a><q><r>', 'spawn --userscript qr')
