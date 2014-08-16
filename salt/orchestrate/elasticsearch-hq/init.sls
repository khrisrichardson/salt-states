# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_elasticsearch-hq:
  salt.state:
    - tgt:         roles:elasticsearch-hq
    - tgt_type:    grain
    - sls:         elasticsearch-hq
    - require:
      - salt:      state_sls_salt-minion

state_sls_elasticsearch-hq_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:elasticsearch-hq'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['elasticsearch-hq']}
    - require:
      - salt:      state_sls_elasticsearch-hq
