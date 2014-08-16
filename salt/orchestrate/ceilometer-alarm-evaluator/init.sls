# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceilometer-alarm-evaluator:
  salt.state:
    - tgt:         roles:ceilometer-alarm-evaluator
    - tgt_type:    grain
    - sls:         ceilometer-alarm-evaluator
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceilometer-alarm-evaluator_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceilometer-alarm-evaluator'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceilometer-alarm-evaluator']}
    - require:
      - salt:      state_sls_ceilometer-alarm-evaluator
