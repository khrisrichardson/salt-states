# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.elasticsearch

state_sls_kibana:
  salt.state:
    - tgt:         roles:kibana
    - tgt_type:    grain
    - sls:         kibana
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_elasticsearch

state_sls_kibana_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:kibana'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['kibana']}
    - require:
      - salt:      state_sls_kibana
