import os
import tomllib
config.load_autoconfig()

c.colors.webpage.preferred_color_scheme= 'dark'
config.bind('<Ctrl+/>', 'hint links spawn --detach mpv {hint-url}')

<<<<<<< HEAD
config.bind('<z><l>', 'spawn --userscript qute-pass')
config.bind('<z><u><l>', 'spawn --userscript qute-pass --username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass --password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass --otp-only')
config.bind('<a><q><r>', 'spawn --userscript qr')
=======
with open(f"{os.environ["HOME"]}/.config/qutebrowser/colors.toml", "rb") as f:
    theme = tomllib.load(f)
colors = theme["colors"]
mappings = theme["mappings"]

for key, value in get_all_keys(mappings, prefix=['colors']):
    config.set(key, colors[value])
config.bind(",w", "open https://web.archive.org/web/20250000000000*/{url}")
config.bind("<Ctrl-c>", "mode-enter normal", mode='insert')
# config.set('content.javascript.enabled', False)
config.set('content.blocking.enabled', False)

>>>>>>> refs/remotes/origin/main
