# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_guvnor-proxy:
  salt.state:
    - tgt:         roles:guvnor-proxy
    - tgt_type:    grain
    - sls:         guvnor-proxy
    - require:
      - salt:      state_sls_salt-minion

state_sls_guvnor-proxy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:guvnor-proxy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['guvnor-proxy']}
    - require:
      - salt:      state_sls_guvnor-proxy
