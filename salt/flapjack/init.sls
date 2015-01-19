# vi: set ft=yaml.jinja :

{% from 'flapjack/map.jinja' import map with context %}

{% set arch  = salt['config.get']('osarch') %}
{% set major = salt['config.get']('osmajorrelease') %}
{% set os    = salt['config.get']('os')|lower %}

include:
  -  python-apt

flapjack:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - humanname:   Flapjack v1
    - baseurl:     http://packages.flapjack.io/rpm/v1/flapjack/{{ os }}/{{ major }}/{{ arch }}/
    - enabled:     1
    - gpgcheck:    0
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       8406B0E3803709B6
    - require:
      - pkg:       python-apt
   {% endif %}
    - require_in:
      - pkg:       flapjack
  pkg.installed:   []
  service.running:
    - enable:      True
    - watch:
      - pkg:       flapjack

/etc/flapjack/flapjack_config.yaml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/flapjack/flapjack_config.yaml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       flapjack
