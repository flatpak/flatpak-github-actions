# The latest version of this script can be found at
# https://gitlab.gnome.org/GNOME/gnome-runtime-images

import json
import os
import sys
from contextlib import contextmanager

from ruamel import yaml


@contextmanager
def rewrite_manifest(filename: str):
    with open(filename) as f:
        if filename.endswith('.json'):
            data = json.load(f)
        else:
            data = yaml.round_trip_load(f, preserve_quotes=True)

    yield data

    with open(filename, 'w') as f:
        if filename.endswith('.json'):
            json.dump(data, f, indent=4, separators=(',', ' : '))
        else:
            yaml.round_trip_dump(data, f)


if __name__ == '__main__':
    try:
        manifestfile, modulename = sys.argv[1:]
    except ValueError:
        print("usage: {} flatpak_manifest module_name".format(sys.argv[0]))
        sys.exit(1)

    with rewrite_manifest(manifestfile) as data:
        for mod in data['modules']:
            if not isinstance(mod, dict):
                continue

            if mod['name'] == modulename:
                for i in range(0, len(mod['sources'])):
                    if not mod['sources'][i]['type'] == 'git':
                        continue

                    path = os.path.relpath('.', os.path.dirname(manifestfile))
                    mod['sources'][i] = {
                        'type': 'dir',
                        'path': path
                    }
