# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.graphite-carbon

state_sls_graphite-web:
  salt.state:
    - tgt:         roles:graphite-web
    - tgt_type:    grain
    - sls:         graphite-web
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_graphite-carbon

state_sls_graphite-web_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:graphite-web'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['graphite-web']}
    - require:
      - salt:      state_sls_graphite-web
