# vi: set ft=yaml.jinja :

{% set environment =  salt['grains.get']('environment') %}
{% set version     = 'cm4' %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.cloudera-{{ version }}-server

state_sls_zookeeper-server:
  salt.state:
    - tgt:         roles:zookeeper-server
    - tgt_type:    grain
    - sls:         zookeeper-server
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_cloudera-{{ version }}-server

state_sls_zookeeper-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:zookeeper-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['zookeeper-server']}
    - require:
      - salt:      state_sls_zookeeper-server
