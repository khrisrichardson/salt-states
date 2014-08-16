# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ceilometer-agent-compute:
  salt.state:
    - tgt:         roles:ceilometer-agent-compute
    - tgt_type:    grain
    - sls:         ceilometer-agent-compute
    - require:
      - salt:      state_sls_salt-minion

state_sls_ceilometer-agent-compute_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ceilometer-agent-compute'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ceilometer-agent-compute']}
    - require:
      - salt:      state_sls_ceilometer-agent-compute
