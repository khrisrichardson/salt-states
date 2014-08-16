# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set minions = salt['roles.dict']('ceph-mds', out='nodename') %}

include:
  -  ceph-deploy
  -  ceph-deploy.relate-ceph-mon

{% if            minions['ceph-mds'] %}
{% for minion in minions['ceph-mds'] %}
{% if  salt['ssh.recv_known_host'](minion) %}

{{ minion }}:
  ssh_known_hosts.present:
    - user:        ceph

{% endif %}

ceph-deploy --cluster {{ cluster }} install {{ minion }}:
  cmd.run:
    - cwd:        /home/ceph/{{ cluster }}
    - user:        ceph
    - onlyif:      ssh -CT -o BatchMode=yes {{ minion }} hostname
    - require:
      - pkg:       ceph-deploy
      - file:     /home/ceph/{{ cluster }}
      - ssh_known_hosts:     {{ minion }}

{% endfor %}
{% endif %}
