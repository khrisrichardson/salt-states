# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_guvnor-postgresql:
  salt.state:
    - tgt:         roles:guvnor-postgresql
    - tgt_type:    grain
    - sls:         guvnor-postgresql
    - require:
      - salt:      state_sls_salt-minion

state_sls_guvnor-postgresql_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:guvnor-postgresql'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['guvnor-postgresql']}
    - require:
      - salt:      state_sls_guvnor-postgresql
