# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ovirt-engine:
  salt.state:
    - tgt:         roles:ovirt-engine
    - tgt_type:    grain
    - sls:         ovirt-engine
    - require:
      - salt:      state_sls_salt-minion

state_sls_ovirt-engine_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ovirt-engine'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ovirt-engine']}
    - require:
      - salt:      state_sls_ovirt-engine
