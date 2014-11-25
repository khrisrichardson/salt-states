# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set roles   = [] %}
{% do  roles.append('etcd') %}
{% do  roles.append('radosgw') %}
{% set minions = salt['roles.dict'](roles) %}
{% set psls    = sls.split('.')[0] %}

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

include:
  -  ceph-mon
  -  supervisor
  {% if minions['radosgw'] %}
  -  ceph-mon.relate-radosgw
  {% endif %}

#-------------------------------------------------------------------------------
# TODO: cannot start until mkfs, which depends on shared fsid
#-------------------------------------------------------------------------------

{% if minions['etcd'] %}

extend:
  ceph-mon:
    supervisord.running:
     {% if minions['radosgw'] %}
      - require_in:
        - cmd:     ceph auth get-or-create client.radosgw.gateway
     {% endif %}
      - watch:
        - pkg:     ceph
        - service: supervisor
        - file:   /etc/ceph/{{ cluster }}.conf
#       - cmd:     ceph-mon --mkfs

{% endif %}

/etc/supervisor/conf.d/{{ psls }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/supervisor/conf.d/{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/bin/supervisord
    - require_in:
      - service:   supervisor
    - watch_in:
      - cmd:       supervisorctl update &

{% endif %}
