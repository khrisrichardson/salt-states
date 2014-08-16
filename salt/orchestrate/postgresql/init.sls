# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_postgresql:
  salt.state:
    - tgt:         roles:postgresql
    - tgt_type:    grain
    - sls:         postgresql
    - require:
      - salt:      state_sls_salt-minion

state_sls_postgresql_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:postgresql'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['postgresql']}
    - require:
      - salt:      state_sls_postgresql
