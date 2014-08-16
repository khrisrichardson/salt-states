# vi: set ft=yaml.jinja :

{% set environment =  salt['grains.get']('environment') %}
{% set version     = 'cm4' %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.cloudera-{{ version }}-server

state_sls_hbase-regionserver:
  salt.state:
    - tgt:         roles:hbase-regionserver
    - tgt_type:    grain
    - sls:         hbase-regionserver
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_cloudera-{{ version }}-server

state_sls_hbase-regionserver_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:hbase-regionserver'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['hbase-regionserver']}
    - require:
      - salt:      state_sls_hbase-regionserver
