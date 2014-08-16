# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_swift-object-expirer:
  salt.state:
    - tgt:         roles:swift-object-expirer
    - tgt_type:    grain
    - sls:         swift-object-expirer
    - require:
      - salt:      state_sls_salt-minion

state_sls_swift-object-expirer_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:swift-object-expirer'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['swift-object-expirer']}
    - require:
      - salt:      state_sls_swift-object-expirer
