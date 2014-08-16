# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_privoxy:
  salt.state:
    - tgt:         roles:privoxy
    - tgt_type:    grain
    - sls:         privoxy
    - require:
      - salt:      state_sls_salt-minion

state_sls_privoxy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:privoxy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['privoxy']}
    - require:
      - salt:      state_sls_privoxy
