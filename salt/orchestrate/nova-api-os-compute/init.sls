# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-api-os-compute:
  salt.state:
    - tgt:         roles:nova-api-os-compute
    - tgt_type:    grain
    - sls:         nova-api-os-compute
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-api-os-compute_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-api-os-compute'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-api-os-compute']}
    - require:
      - salt:      state_sls_nova-api-os-compute
