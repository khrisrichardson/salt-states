# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('ceph-deploy', out='nodename') %}

{% if minions['ceph-deploy']
   and        'ceph-deploy' not in salt['config.get']('roles') %}

include:
  -  ceph.depend-openssh
  -  ceph.depend-sudo

{% for minion in minions['ceph-deploy'] %}

ceph@{{ minion }}:
  ssh_auth.present:
    - user:        ceph
    - source:      salt://{{ minion }}/home/ceph/.ssh/id_rsa.pub
    - require:
      - file:     /home/ceph/.ssh

{% endfor %}
{% endif %}
