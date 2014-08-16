# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-objectstore:
  salt.state:
    - tgt:         roles:nova-objectstore
    - tgt_type:    grain
    - sls:         nova-objectstore
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-objectstore_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-objectstore'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-objectstore']}
    - require:
      - salt:      state_sls_nova-objectstore
