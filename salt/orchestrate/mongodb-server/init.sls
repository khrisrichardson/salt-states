# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_mongodb-server:
  salt.state:
    - tgt:         roles:mongodb-server
    - tgt_type:    grain
    - sls:         mongodb-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_mongodb-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:mongodb-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['mongodb-server']}
    - require:
      - salt:      state_sls_mongodb-server
