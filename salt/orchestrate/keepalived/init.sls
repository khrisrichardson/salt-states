# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_keepalived:
  salt.state:
    - tgt:         roles:keepalived
    - tgt_type:    grain
    - sls:         keepalived
    - require:
      - salt:      state_sls_salt-minion

state_sls_keepalived_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:keepalived'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['keepalived']}
    - require:
      - salt:      state_sls_keepalived
