# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('marathon') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  python-marathon
  -  salt-minion

{% if minions['marathon'] %}

/etc/salt/minion.d/marathon.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/marathon.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/salt/minion.d
      - pip:       python-marathon
    - watch_in:
      - service:   salt-minion

{% endif %}
