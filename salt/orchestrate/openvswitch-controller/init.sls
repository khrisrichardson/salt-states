# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_openvswitch-controller:
  salt.state:
    - tgt:         roles:openvswitch-controller
    - tgt_type:    grain
    - sls:         openvswitch-controller
    - require:
      - salt:      state_sls_salt-minion

state_sls_openvswitch-controller_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:openvswitch-controller'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['openvswitch-controller']}
    - require:
      - salt:      state_sls_openvswitch-controller
