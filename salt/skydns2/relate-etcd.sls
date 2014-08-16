# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('etcd') %}
{% set psls    = sls.split('.')[0] %}
{% set key     = '/skydns/config' %}
{% set value   = '{"dns_addr":"0.0.0.0:53","nameservers":["8.8.8.8:53","8.8.4.4:53"]}' %}

include:
  -  skydns2

/etc/profile.d/skydns2.sh:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/profile.d/skydns2.sh
    - user:        root
    - group:       root
    - mode:       '0644'

{% if minions['etcd'] %}
{% if salt['etcd.get'](key) != value %}

etcdctl set {{ key }}:
  module.run:
    - name:        etcd.set
    - key:      {{ key }}
    - value:    |-
                {{ value }}

{% endif %}
{% endif %}
