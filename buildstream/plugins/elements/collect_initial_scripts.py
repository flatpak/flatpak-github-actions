"""
BuildStream does not save file permissions, and ownership.
include/excludes with integration commands is so complex that only
the "compose" plugin does it correctly

Because "compose" does not save file permissions and loses integration
commands (because they are executed), that means we need to save it another
file permissions another way.

This is where collect_initial_scripts works around the issue. It provides a
way to have integration scripts that we execute when we pack into an image
(filesystem, tar, ostree, etc.)
"""

import os
import re
from buildstream import Element

class ExtractInitialScriptsElement(Element):

    BST_MIN_VERSION = "2.0"
    BST_FORBID_RDEPENDS = True
    BST_FORBID_SOURCES = True

    def configure(self, node):
        node.validate_keys(['path'])

        self.path = node.get_str('path')

    def preflight(self):
        pass

    def get_unique_key(self):
        key = {
            'path': self.path,
        }
        return key

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def assemble(self, sandbox):
        basedir = sandbox.get_virtual_directory()
        relative_path = self.path.strip(os.sep)

        index = 0
        for dependency in self.dependencies():
            public = dependency.get_public_data('initial-script')
            if public and 'script' in public:
                script = self.node_subst_vars(public.get_scalar('script'))
                index += 1
                depname = re.sub('[^A-Za-z0-9]', '_', dependency.name)
                basename = f'{index:03}-{depname}'

                pathdir = basedir.open_directory(relative_path, create=True)
                with pathdir.open_file(basename, mode='w') as f:
                    f.write(script)
                    os.chmod(f.fileno(), 0o755)

        return os.sep

def setup():
    return ExtractInitialScriptsElement

