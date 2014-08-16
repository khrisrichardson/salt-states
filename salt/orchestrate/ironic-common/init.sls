# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_ironic-common:
  salt.state:
    - tgt:         roles:ironic-common
    - tgt_type:    grain
    - sls:         ironic-common
    - require:
      - salt:      state_sls_salt-minion

state_sls_ironic-common_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:ironic-common'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['ironic-common']}
    - require:
      - salt:      state_sls_ironic-common
