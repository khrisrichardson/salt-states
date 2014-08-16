# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_solr-zookeeper:
  salt.state:
    - tgt:         roles:solr-zookeeper
    - tgt_type:    grain
    - sls:         solr-zookeeper
    - require:
      - salt:      state_sls_salt-minion

state_sls_solr-zookeeper_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:solr-zookeeper'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['solr-zookeeper']}
    - require:
      - salt:      state_sls_solr-zookeeper
