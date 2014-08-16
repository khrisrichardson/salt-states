# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cloudera-cm5-server-db:
  salt.state:
    - tgt:         roles:cloudera-cm5-server-db
    - tgt_type:    grain
    - sls:         cloudera-cm5-server-db
    - require:
      - salt:      state_sls_salt-minion

state_sls_cloudera-cm5-server-db_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cloudera-cm5-server-db'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cloudera-cm5-server-db']}
    - require:
      - salt:      state_sls_cloudera-cm5-server-db
