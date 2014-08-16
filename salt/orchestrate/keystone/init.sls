# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_keystone:
  salt.state:
    - tgt:         roles:keystone
    - tgt_type:    grain
    - sls:         keystone
    - require:
      - salt:      state_sls_salt-minion

state_sls_keystone_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:keystone'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['keystone']}
    - require:
      - salt:      state_sls_keystone
