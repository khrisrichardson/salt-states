# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('ceph-deploy') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  sudo

{% if minions['ceph-deploy'] %}

/etc/sudoers.d/ceph:
  file.managed:
    - source:      salt://{{ psls }}/etc/sudoers.d/ceph
    - user:        root
    - group:       root
    - mode:       '0440'
    - require:
      - pkg:       sudo
    - watch_in:
      - service:   sudo

{% endif %}
