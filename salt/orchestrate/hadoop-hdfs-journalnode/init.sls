# vi: set ft=yaml.jinja :

{% set environment =  salt['grains.get']('environment') %}
{% set version     = 'cm4' %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.cloudera-{{ version }}-server
  -  orchestrate.zookeeper-server

state_sls_hadoop-hdfs-journalnode:
  salt.state:
    - tgt:         roles:hadoop-hdfs-journalnode
    - tgt_type:    grain
    - sls:         hadoop-hdfs-journalnode
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_cloudera-{{ version }}-server
      - salt:      state_sls_zookeeper-server

state_sls_hadoop-hdfs-journalnode_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:hadoop-hdfs-journalnode'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['hadoop-hdfs-journalnode']}
    - require:
      - salt:      state_sls_hadoop-hdfs-journalnode
