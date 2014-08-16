# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_mysql-server:
  salt.state:
    - tgt:         roles:mysql-server
    - tgt_type:    grain
    - sls:         mysql-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_mysql-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:mysql-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['mysql-server']}
    - require:
      - salt:      state_sls_mysql-server
