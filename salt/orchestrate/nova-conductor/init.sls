# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-conductor:
  salt.state:
    - tgt:         roles:nova-conductor
    - tgt_type:    grain
    - sls:         nova-conductor
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-conductor_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-conductor'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-conductor']}
    - require:
      - salt:      state_sls_nova-conductor
