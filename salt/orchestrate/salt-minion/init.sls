# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-master

state_sls_salt-minion:
  salt.state:
    - tgt:        '*'
    - sls:         salt-minion
    - require:
      - salt:      state_sls_salt-master

state_sls_salt-minion_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:salt-minion'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['salt-minion']}
    - require:
      - salt:      state_sls_salt-minion
