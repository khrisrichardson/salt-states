# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-cells:
  salt.state:
    - tgt:         roles:nova-cells
    - tgt_type:    grain
    - sls:         nova-cells
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-cells_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-cells'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-cells']}
    - require:
      - salt:      state_sls_nova-cells
