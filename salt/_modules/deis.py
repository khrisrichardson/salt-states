# -*- coding: utf-8 -*-
"""
Manage Deis

:maintainer: Khris Richardson <khris.richardson@gmail.com>
:maturity: new
:platform: linux

:depends: - deis
"""

# http://docs.deis.io/en/latest/_modules/client/deis/

# import libs: standard
from __future__ import absolute_import
from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division

# import libs: salt
from salt.utils import which


def __virtual__():
    """
    Only return if deis is installed
    """
    return 'deis' if which('deis') else False
