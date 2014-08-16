# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_swift-account:
  salt.state:
    - tgt:         roles:swift-account
    - tgt_type:    grain
    - sls:         swift-account
    - require:
      - salt:      state_sls_salt-minion

state_sls_swift-account_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:swift-account'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['swift-account']}
    - require:
      - salt:      state_sls_swift-account
