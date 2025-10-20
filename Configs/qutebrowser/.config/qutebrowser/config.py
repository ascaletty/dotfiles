import os
import tomllib
config.load_autoconfig()

c.colors.webpage.preferred_color_scheme= 'dark'
def get_all_keys(d, prefix=[]):
    for k, v in d.items():
        if isinstance(v, dict):
            yield from get_all_keys(v, prefix + [k])
        else:
            yield (".".join(prefix + [k]), v)

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

