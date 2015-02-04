# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  apt

{% if salt['config.get']('os_family') == 'Debian' %}

/etc/apt/apt.conf.d/30proxy:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/apt/apt.conf.d/30proxy
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       apt

{% endif %}
