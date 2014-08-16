# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set minions = salt['roles.dict']('ceph-osd', out='nodename') %}

include:
  -  ceph-deploy
  -  ceph-deploy.relate-ceph-mon

{% if            minions['ceph-osd'] %}
{% for minion in minions['ceph-osd'] %}
{% if  salt['ssh.recv_known_host'](minion) %}

{{ minion }}:
  ssh_known_hosts.present:
    - user:        ceph
    - require_in:
      - cmd:       ceph-deploy --cluster {{ cluster }} install {{ minion }}

{% endif %}

ceph-deploy --cluster {{ cluster }} install {{ minion }}:
  cmd.run:
    - cwd:        /home/ceph/{{ cluster }}
    - user:        ceph
    - onlyif:      ssh -CT -o BatchMode=yes {{ minion }} hostname
    - require:
      - pkg:       ceph-deploy
      - file:     /home/ceph/{{ cluster }}

{% endfor %}
{% endif %}
