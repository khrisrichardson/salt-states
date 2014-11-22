# vi: set ft=yaml.jinja :

{% set host    = salt['config.get']('host') %}
{% set ipv4    = salt['config.get']('fqdn_ip4') %}
{% set minions = salt['roles.dict']('etcd') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  salt-minion

{% if minions['etcd'] %}

/etc/salt/minion.d/etcd.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/etcd.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/salt/minion.d
    - watch_in:
      - service:   salt-minion

{% set key   = '/skydns/local/skydns/' + host %}
{% set value = '{"host":"' + ipv4[0] + '"}' %}

#-------------------------------------------------------------------------------
# TODO: short-circuit
#-------------------------------------------------------------------------------

{# if salt['etcd.get'](key) != value #}

etcdctl set {{ key }}:
  module.run:
    - name:        etcd.set
    - key:      {{ key }}
    - value:    |-
                {{ value }}
    - require:
      - file:     /etc/salt/minion.d/etcd.conf

{# endif #}

{% set key   = '/skydns/arpa/in-addr/' + ipv4[0]|replace('.', '/') %}
{% set value = '{"host":"' + host + '.skydns.local"}' %}

#-------------------------------------------------------------------------------
# TODO: short-circuit
#-------------------------------------------------------------------------------

{# if salt['etcd.get'](key) != value #}

etcdctl set {{ key }}:
  module.run:
    - name:        etcd.set
    - key:      {{ key }}
    - value:    |-
                {{ value }}
    - require:
      - file:     /etc/salt/minion.d/etcd.conf

{# endif #}
{% else %}

/etc/salt/minion.d/etcd.conf:
  file.absent:
    - watch_in:
      - service:   salt-minion

{% endif %}
