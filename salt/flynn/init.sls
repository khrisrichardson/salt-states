# vi: set ft=yaml.jinja :

include:
  -  python-apt

flynn:
  pkgrepo.managed:
    - name:        deb https://dl.flynn.io/ubuntu flynn main
    - file:       /etc/apt/sources.list.d/flynn.list
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       BC79739C507A9B53BB1B0E7D820A5489998D827B
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
