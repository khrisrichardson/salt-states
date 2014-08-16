# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-common:
  salt.state:
    - tgt:         roles:neutron-common
    - tgt_type:    grain
    - sls:         neutron-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-common']}
    - require:
      - salt:      state_sls_neutron-common
