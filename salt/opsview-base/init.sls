# vi: set ft=yaml.jinja :

{% from 'opsview-base/map.jinja' import map with context %}

include:
  -  python-apt
  -  rpmforge-release

opsview-base:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - gpgkey:   {{ map.get('pkgrepo', {}).get('key_url') }}
    - key_url:  {{ map.get('pkgrepo', {}).get('key_url') }}
    - humanname:   Opsview
    - baseurl:     http://downloads.opsview.com/opsview-core/latest/yum/centos/6/$basearch
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
