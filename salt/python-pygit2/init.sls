# vi: set ft=yaml.jinja :

include:
  -  python-apt

python-pygit2:
  pkgrepo.managed:
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       F3FA6A64F50B4114
    - ppa:         dennis/python
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   python-pygit2
