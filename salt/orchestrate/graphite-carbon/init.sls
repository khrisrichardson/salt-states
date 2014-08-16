# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_graphite-carbon:
  salt.state:
    - tgt:         roles:graphite-carbon
    - tgt_type:    grain
    - sls:         graphite-carbon
    - require:
      - salt:      state_sls_salt-minion

state_sls_graphite-carbon_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:graphite-carbon'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['graphite-carbon']}
    - require:
      - salt:      state_sls_graphite-carbon
