# vi: set ft=yaml.jinja :

include:
  -  apt

{% if salt['config.get']('os_family') == 'Debian' %}

/etc/apt/apt.conf.d/30proxy:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/apt/apt.conf.d/30proxy
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       apt

{% endif %}
