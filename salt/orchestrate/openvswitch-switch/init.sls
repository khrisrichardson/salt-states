# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_openvswitch-switch:
  salt.state:
    - tgt:         roles:openvswitch-switch
    - tgt_type:    grain
    - sls:         openvswitch-switch
    - require:
      - salt:      state_sls_salt-minion

state_sls_openvswitch-switch_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:openvswitch-switch'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['openvswitch-switch']}
    - require:
      - salt:      state_sls_openvswitch-switch
