# vi: set ft=yaml.jinja :

{% set cluster = salt['grains.get']('environment', 'ceph') %}
{% set minions = salt['roles.dict']('ceph-mon', out='nodename') %}

include:
  -  ceph-deploy

{% if            minions['ceph-mon'] %}
{% for minion in minions['ceph-mon'] %}
{% if  salt['ssh.recv_known_host'](minion) %}

{{ minion }}:
  ssh_known_hosts.present:
    - user:        ceph
    - require:
      - file:     /home/ceph/.ssh
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

ceph-deploy --cluster {{ cluster }} new {{ minion }}:
  cmd.wait:
    - cwd:        /home/ceph/{{ cluster }}
    - user:        ceph
    - watch:
      - cmd:       ceph-deploy --cluster {{ cluster }} install {{ minion }}

ceph-deploy --cluster {{ cluster }} mon create {{ minion }}:
  cmd.wait:
    - cwd:        /home/ceph/{{ cluster }}
    - user:        ceph
    - watch:
      - cmd:       ceph-deploy --cluster {{ cluster }} new {{ minion }}

ceph-deploy --cluster {{ cluster }} gatherkeys {{ minion }}:
  cmd.wait:
    - cwd:        /home/ceph/{{ cluster }}
    - user:        ceph
    - watch:
      - cmd:       ceph-deploy --cluster {{ cluster }} mon create {{ minion }}

{% endfor %}
{% endif %}
