# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mesos-dns') %}

include:
  -  mesos-dns

{% if minions['mesos-dns'] %}

/etc/mesos-dns/config.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/mesos-dns/config.json
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/mesos-dns

{% endif %}
