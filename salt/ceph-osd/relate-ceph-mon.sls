# vi: set ft=yaml.jinja :

{% set roles = [] %}
{% do  roles.append('ceph-mon') %}
{% do  roles.append('salt-master') %}
{% set minions = salt['roles.dict'](roles) %}
{% set cluster = salt['grains.get']('environment', 'ceph') %}

{% if  minions['ceph-mon']
   and minions['salt-master'] %}

cp.get_file /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring:
  module.run:
    - name:        cp.get_file
    - path:        salt://{{ minions['ceph-mon'][0] }}/var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring
    - dest:       /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring
    - unless:      test -f /var/lib/ceph/bootstrap-osd/{{ cluster }}.keyring

{% endif %}
