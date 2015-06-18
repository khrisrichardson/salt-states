# -*- coding: utf-8 -*-
"""
Manage Apache Ivy

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux

:depends: - ivy
"""

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division

# import libs: salt
from salt.utils import which


def __virtual__():
    """
    Only return if ivy is installed
    """
    return 'ivy' if which('ivy') else False
