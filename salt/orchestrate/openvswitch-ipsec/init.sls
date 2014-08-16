# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_openvswitch-ipsec:
  salt.state:
    - tgt:         roles:openvswitch-ipsec
    - tgt_type:    grain
    - sls:         openvswitch-ipsec
    - require:
      - salt:      state_sls_salt-minion

state_sls_openvswitch-ipsec_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:openvswitch-ipsec'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['openvswitch-ipsec']}
    - require:
      - salt:      state_sls_openvswitch-ipsec
