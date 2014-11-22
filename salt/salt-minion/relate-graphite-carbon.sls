# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('graphite-carbon') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  salt-minion

{% if minions['graphite-carbon'] %}

/etc/salt/minion.d/graphite-carbon.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/graphite-carbon.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/salt/minion.d
    - watch_in:
      - service:   salt-minion

{% endif %}
