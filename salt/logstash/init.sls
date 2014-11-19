# vi: set ft=yaml.jinja :

{% from 'logstash/map.jinja' import map with context %}

include:
  -  debianutils
  -  libzmq3-dev
  -  python-apt
  -  ruby-ffi-rzmq
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}

logstash:
  pkgrepo.managed:
    - name:     {{ map.get('pkgrepo', {}).get('name') }}
    - file:     {{ map.get('pkgrepo', {}).get('file') }}
    - gpgkey:      http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - key_url:     http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - humanname:   logstash repository for {{ map.get('version') }}.x packages
    - baseurl:     http://packages.elasticsearch.org/logstash/{{ map.get('version') }}/centos
    - enabled:     1
    - gpgcheck:    1
    - consolidate: True
   {% if salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkg:       python-apt
   {% endif %}
  pkg.installed:
    - order:      -1
    - require:
      - pkgrepo:   logstash
  service.running:
    - order:      -1
    - enable:      True
    - require:
      - pkg:       debianutils
      - file:     /usr/bin/java
     {% if salt['config.get']('os_family') == 'Debian' %}
      - pkg:       ruby-ffi-rzmq
     {% endif %}
    - watch:
      - pkg:       logstash

/etc/default/logstash:
  file.replace:
    - name:     {{ map.get('/etc/default/logstash', {}).get('file', {}).get('name') }}
   {% if   salt['config.get']('os_family') == 'RedHat' %}
    - pattern:     START=false
    - repl:        START=true
   {% elif salt['config.get']('os_family') == 'Debian' %}
    - pattern:     START=no
    - repl:        START=yes
   {% endif %}
    - watch:
      - pkg:       logstash
    - watch_in:
      - service:   logstash

{% if 'logstash' in salt['config.get']('roles', []) %}

/etc/logstash/conf.d/input-zeromq.conf:
  file.managed:
    - source:      salt://{{ sls }}/etc/logstash/conf.d/input-zeromq.conf
    - user:        logstash
    - group:       logstash
    - mode:       '0644'
    - require:
      - pkg:       libzmq3-dev
      - pkg:       logstash
    - watch_in:
      - service:   logstash

/etc/logstash/conf.d/output-zeromq.conf:
  file.absent:
    - watch_in:
      - service:   logstash

{% else %}

/etc/logstash/conf.d/input-zeromq.conf:
  file.absent:
    - watch_in:
      - service:   logstash

/etc/logstash/conf.d/output-zeromq.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/logstash/conf.d/output-zeromq.conf
    - user:        logstash
    - group:       logstash
    - mode:       '0644'
    - require:
      - pkg:       libzmq3-dev
      - pkg:       logstash
    - watch_in:
      - service:   logstash

{% endif %}
