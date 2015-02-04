# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('mesos-dns') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  mesos-dns

{% if minions['mesos-dns'] %}

/etc/mesos-dns/config.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/mesos-dns/config.json
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/mesos-dns

{% endif %}
