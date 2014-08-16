# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_swift-object:
  salt.state:
    - tgt:         roles:swift-object
    - tgt_type:    grain
    - sls:         swift-object
    - require:
      - salt:      state_sls_salt-minion

state_sls_swift-object_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:swift-object'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['swift-object']}
    - require:
      - salt:      state_sls_swift-object
