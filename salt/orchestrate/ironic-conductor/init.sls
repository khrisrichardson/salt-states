# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ironic-conductor:
  salt.state:
    - tgt:         roles:ironic-conductor
    - tgt_type:    grain
    - sls:         ironic-conductor
    - require:
      - salt:      state_sls_salt-minion

state_sls_ironic-conductor_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ironic-conductor'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ironic-conductor']}
    - require:
      - salt:      state_sls_ironic-conductor
