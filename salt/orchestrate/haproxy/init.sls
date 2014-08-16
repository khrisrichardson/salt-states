# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_haproxy:
  salt.state:
    - tgt:         roles:haproxy
    - tgt_type:    grain
    - sls:         haproxy
    - require:
      - salt:      state_sls_salt-minion

state_sls_haproxy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:haproxy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['haproxy']}
    - require:
      - salt:      state_sls_haproxy
