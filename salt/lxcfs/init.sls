# vi: set ft=yaml.jinja :

import:
  -  lxc

lxcfs:
  pkg.installed:
    - require:
      - pkgrepo:   lxc
