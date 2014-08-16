# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_swift-proxy:
  salt.state:
    - tgt:         roles:swift-proxy
    - tgt_type:    grain
    - sls:         swift-proxy
    - require:
      - salt:      state_sls_salt-minion

state_sls_swift-proxy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:swift-proxy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['swift-proxy']}
    - require:
      - salt:      state_sls_swift-proxy
