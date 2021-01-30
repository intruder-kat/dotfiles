#!/usr/bin/env python3

"""
reload alacritty color config from xresources
"""

import os
import sys
import yaml
from subprocess import check_output, check_call

# resolve yamlbois to xresources keys
MAPPING = {
    'normal': {
        'black':   '*.color0',
        'red':     '*.color1',
        'green':   '*.color2',
        'yellow':  '*.color3',
        'blue':    '*.color4',
        'magenta': '*.color5',
        'cyan':    '*.color6',
        'white':   '*.color7',
    },

    'bright': {
        'black':   '*.color8',
        'red':     '*.color9',
        'green':   '*.color10',
        'yellow':  '*.color11',
        'blue':    '*.color12',
        'magenta': '*.color13',
        'cyan':    '*.color14',
        'white':   '*.color15'
    }
}

def main():
    conf = os.path.dirname(os.path.realpath(__file__)) + '/alacritty.yml'

    # load existing config
    with open(conf) as f:
        if None is (config := yaml.safe_load(f)):
            print("Failed to find document :/")
            return 1

    # load xresources colors
    xrdbconf = os.getenv('HOME', default='.') + '/.Xresources'

    check_call(['xrdb', xrdbconf])

    resources = {}

    for key in MAPPING:
        resources[key] = {}

        for color in MAPPING[key]:
            resources[key][color] = check_output(['xgetres', MAPPING[key][color]]).decode().strip()

    if 'colors' not in config:
        config['colors'] = {}

    for key in resources:
        config['colors'][key] = resources[key]

    with open(conf, 'w') as f:
        f.write(yaml.dump(config))

    return 0


if __name__ == "__main__":
    sys.exit(main())

