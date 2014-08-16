# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set minions = salt['roles.dict']('etcd') %}
{% set key     = '/ceph/' + cluster + '/fsid' %}
{% set value   = salt['cmd.run']('uuidgen') %}

{% if minions['etcd'] %}
{% if not salt['etcd.ls'](key) %}

etcdctl set {{ key }}:
  module.run:
    - name:        etcd.set
    - key:      {{ key }}
    - value:    |-
                {{ value }}

{% endif %}
{% endif %}
