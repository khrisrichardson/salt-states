# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceilometer-agent-central:
  salt.state:
    - tgt:         roles:ceilometer-agent-central
    - tgt_type:    grain
    - sls:         ceilometer-agent-central
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceilometer-agent-central_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceilometer-agent-central'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceilometer-agent-central']}
    - require:
      - salt:      state_sls_ceilometer-agent-central
