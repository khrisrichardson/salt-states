# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('elasticsearch') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  python-elasticsearch
  -  salt-minion

{% if minions['elasticsearch'] %}

/etc/salt/minion.d/elasticsearch.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/salt/minion.d/elasticsearch.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /etc/salt/minion.d
      - pip:       python-elasticsearch
    - watch_in:
      - service:   salt-minion

{% endif %}
