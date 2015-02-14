# vi: set ft=yaml.jinja :

include:
  -  lxd

criu:
  pkgrepo.managed:
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       D5495F657635B973
    - ppa:         ubuntu-lxc/lxd-daily
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   lxd
