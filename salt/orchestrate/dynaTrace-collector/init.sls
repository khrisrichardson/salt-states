# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_dynaTrace-collector:
  salt.state:
    - tgt:         roles:dynaTrace-collector
    - tgt_type:    grain
    - sls:         dynaTrace-collector
    - require:
      - salt:      state_sls_salt-minion

state_sls_dynaTrace-collector_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:dynaTrace-collector'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['dynaTrace-collector']}
    - require:
      - salt:      state_sls_dynaTrace-collector
