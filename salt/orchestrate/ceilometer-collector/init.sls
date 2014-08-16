# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceilometer-collector:
  salt.state:
    - tgt:         roles:ceilometer-collector
    - tgt_type:    grain
    - sls:         ceilometer-collector
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceilometer-collector_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceilometer-collector'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceilometer-collector']}
    - require:
      - salt:      state_sls_ceilometer-collector
