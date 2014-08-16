# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_mariadb-server:
  salt.state:
    - tgt:         roles:mariadb-server
    - tgt_type:    grain
    - sls:         mariadb-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_mariadb-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:mariadb-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['mariadb-server']}
    - require:
      - salt:      state_sls_mariadb-server
