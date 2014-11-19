# vi: set ft=yaml.jinja :

{% from 'postfix/map.jinja' import map with context %}

{% if salt['config.get']('os_family') == 'Debian' %}

include:
  -  debconf-utils

{% endif %}

postfix:
{% if salt['config.get']('os_family') == 'Debian' %}
  debconf.set_file:
    - source:      salt://{{ sls }}/pkg.selections
    - require:
      - pkg:       debconf-utils
    - require_in:
      - pkg:       postfix
{% endif %}
  pkg.installed:   []
  service.running:
    - enable:      True
    - reload:      True
    - sig:      {{ map.get('/usr/lib/postfix', {}).get('file', {}).get('name') }}/master
    - watch:
      - pkg:       postfix

/etc/postfix/main.cf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/postfix/main.cf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch_in:
      - service:   postfix
