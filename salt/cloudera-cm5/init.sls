# vi: set ft=yaml.jinja :

{% from 'cloudera-cm5/map.jinja' import map with context %}

{% set arch   = salt['config.get']('osarch') %}
{% set family = salt['config.get']('os_family')|lower %}
{% set major  = salt['config.get']('osmajorrelease') %}

include:
  -  netbase
  -  python-apt

cloudera-cm5:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - gpgkey:   {{ map.get('pkgrepo', {}).get('key_url') }}
    - key_url:  {{ map.get('pkgrepo', {}).get('key_url') }}
    - humanname:   Cloudera Manager
    - baseurl:     http://archive.cloudera.com/cm5/{{ family }}/{{ major }}/{{ arch }}/cm/5/
    - comps:       contrib
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
