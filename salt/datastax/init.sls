# vi: set ft=yaml.jinja :

{% from 'datastax/map.jinja' import map with context %}

{% set family = salt['config.get']('os_family')|lower %}

include:
  -  python-apt

datastax:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - gpgkey:      http://debian.datastax.com/{{ family }}/repo_key
    - key_url:     http://debian.datastax.com/{{ family }}/repo_key
    - humanname:   DataStax Repo for Apache Cassandra
    - baseurl:     http://rpm.datastax.com/community
    - enabled:     1
    - gpgcheck:    0
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
