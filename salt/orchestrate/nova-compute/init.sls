# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-compute:
  salt.state:
    - tgt:         roles:nova-compute
    - tgt_type:    grain
    - sls:         nova-compute
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-compute_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-compute'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-compute']}
    - require:
      - salt:      state_sls_nova-compute
