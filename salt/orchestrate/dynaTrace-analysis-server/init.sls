# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_dynaTrace-analysis-server:
  salt.state:
    - tgt:         roles:dynaTrace-analysis-server
    - tgt_type:    grain
    - sls:         dynaTrace-analysis-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_dynaTrace-analysis-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:dynaTrace-analysis-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['dynaTrace-analysis-server']}
    - require:
      - salt:      state_sls_dynaTrace-analysis-server
