# -*- coding: utf-8 -*-
"""
Manage Fig

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux

:depends: - fig
"""

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from future import standard_library
standard_library.install_aliases()


def __virtual__():
    """
    Only return if fig is installed
    """
    return 'fig' if salt.utils.which('fig') else False
