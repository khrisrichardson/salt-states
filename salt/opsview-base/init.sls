# vi: set ft=yaml.jinja :

{% from 'opsview-base/map.jinja' import map with context %}

{% set major = salt['config.get']('osmajorrelease') %}
{% set os    = salt['config.get']('os')|lower %}

include:
  -  python-apt
  -  rpmforge-release

opsview-base:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - keyserver:   hkp://subkeys.pgp.net:80
    - keyid:       0FC6984B
    - humanname:   Opsview
    - baseurl:     http://downloads.opsview.com/opsview-core/latest/yum/{{ os }}/{{ major }}/$basearch
    - enabled:     1
    - gpgcheck:    0
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   opsview-base
   {% if salt['config.get']('os_family') == 'RedHat' %}
      - pkgrepo:   rpmforge
   {% endif %}
