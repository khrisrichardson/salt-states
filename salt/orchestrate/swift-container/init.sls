# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_swift-container:
  salt.state:
    - tgt:         roles:swift-container
    - tgt_type:    grain
    - sls:         swift-container
    - require:
      - salt:      state_sls_salt-minion

state_sls_swift-container_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:swift-container'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['swift-container']}
    - require:
      - salt:      state_sls_swift-container
