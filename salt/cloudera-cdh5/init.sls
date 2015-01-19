# vi: set ft=yaml.jinja :

{% from 'cloudera-cdh5/map.jinja' import map with context %}

{% set arch   = salt['config.get']('osarch') %}
{% set family = salt['config.get']('os_family')|lower %}
{% set major  = salt['config.get']('osmajorrelease') %}

include:
  -  procps
  -  python-apt

cloudera-cdh5:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - gpgkey:   {{ map.get('pkgrepo', {}).get('key_url') }}
    - key_url:  {{ map.get('pkgrepo', {}).get('key_url') }}
    - humanname:   Cloudera's Distribution for Hadoop, Version 5
    - baseurl:     http://archive.cloudera.com/cdh5/{{ family }}/{{ major }}/{{ arch }}/cdh/4/
    - comps:       contrib
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

vm.swappiness:
  sysctl.present:
    - value:       0
    - require:
      - pkg:       procps

{% endif %}
