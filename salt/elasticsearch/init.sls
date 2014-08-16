# vi: set ft=yaml.jinja :

{% set version = '1.3' %}

include:
  -  oracle-java7-installer
  -  python-apt

elasticsearch:
  pkgrepo.managed:
    - name:     {{ salt['config.get']('elasticsearch:pkgrepo:name') }}
    - file:     {{ salt['config.get']('elasticsearch:pkgrepo:file') }}
    - gpgkey:      http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - key_url:     http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - humanname:   elasticsearch repository for {{ version }}.x packages
    - baseurl:     http://packages.elasticsearch.org/elasticsearch/{{ version }}/centos
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
      - pkg:       oracle-java7-installer
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
