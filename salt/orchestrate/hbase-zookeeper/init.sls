# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_hbase-zookeeper:
  salt.state:
    - tgt:         roles:hbase-zookeeper
    - tgt_type:    grain
    - sls:         hbase-zookeeper
    - require:
      - salt:      state_sls_salt-minion

state_sls_hbase-zookeeper_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:hbase-zookeeper'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['hbase-zookeeper']}
    - require:
      - salt:      state_sls_hbase-zookeeper
