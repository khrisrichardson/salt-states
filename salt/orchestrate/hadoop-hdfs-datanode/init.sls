# vi: set ft=yaml.jinja :

{% set environment =  salt['grains.get']('environment') %}
{% set version     = 'cm4' %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.cloudera-{{ version }}-server

state_sls_hadoop-hdfs-datanode:
  salt.state:
    - tgt:         roles:hadoop-hdfs-datanode
    - tgt_type:    grain
    - sls:         hadoop-hdfs-datanode
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_cloudera-{{ version }}-server

state_sls_hadoop-hdfs-datanode_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:hadoop-hdfs-datanode'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['hadoop-hdfs-datanode']}
    - require:
      - salt:      state_sls_hadoop-hdfs-datanode
