# vi: set ft=yaml.jinja :

{% from 'elasticsearch/map.jinja' import map with context %}

include:
  -  debianutils
  -  elasticsearch-kopf
  -  python-apt
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}

elasticsearch:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - gpgkey:      http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - key_url:     http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - humanname:   elasticsearch repository for {{ map.get('version') }}.x packages
    - baseurl:     http://packages.elasticsearch.org/elasticsearch/{{ map.get('version') }}/centos
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - require:
      - pkgrepo:   elasticsearch
  service.running:
    - enable:      True
    - reload:      True
    - require:
      - pkg:       debianutils
      - file:     /usr/bin/java
    - watch:
      - pkg:       elasticsearch

/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/elasticsearch/elasticsearch.yml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       elasticsearch
    - watch_in:
      - service:   elasticsearch
