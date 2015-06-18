# -*- coding: utf-8 -*-
"""
Manage HashiCorp Consul

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux

:depends: - python-consulate
"""

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division

try:
    import consulate

    HAS_LIBS = True
except ImportError:
    HAS_LIBS = False


def __virtual__():
    """
    Only return if python-consulate is installed
    """
    return 'consul' if HAS_LIBS else False
