# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_dynaTrace-server:
  salt.state:
    - tgt:         roles:dynaTrace-server
    - tgt_type:    grain
    - sls:         dynaTrace-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_dynaTrace-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:dynaTrace-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['dynaTrace-server']}
    - require:
      - salt:      state_sls_dynaTrace-server
