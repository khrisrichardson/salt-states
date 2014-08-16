# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_cassandra:
  salt.state:
    - tgt:         roles:cassandra
    - tgt_type:    grain
    - sls:         cassandra
    - require:
      - salt:      state_sls_salt-minion

state_sls_cassandra_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:cassandra'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['cassandra']}
    - require:
      - salt:      state_sls_cassandra
