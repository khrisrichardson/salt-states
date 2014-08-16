# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-network:
  salt.state:
    - tgt:         roles:nova-network
    - tgt_type:    grain
    - sls:         nova-network
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-network_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-network'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-network']}
    - require:
      - salt:      state_sls_nova-network
