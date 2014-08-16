# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.elasticsearch

state_sls_elasticsearch-kopf:
  salt.state:
    - tgt:         roles:elasticsearch-kopf
    - tgt_type:    grain
    - sls:         elasticsearch-kopf
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_elasticsearch

state_sls_elasticsearch-kopf_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:elasticsearch-kopf'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['elasticsearch-kopf']}
    - require:
      - salt:      state_sls_elasticsearch-kopf
