# vi: set ft=yaml.jinja :

{% set environment =  salt['grains.get']('environment') %}
{% set version     = 'cm4' %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.cloudera-{{ version }}-server
  -  orchestrate.hadoop-hdfs-journalnode
  -  orchestrate.hadoop-hdfs-secondarynamenode
  -  orchestrate.hadoop-hdfs-datanode

state_sls_hadoop-hdfs-namenode:
  salt.state:
    - tgt:         roles:hadoop-hdfs-namenode
    - tgt_type:    grain
    - sls:         hadoop-hdfs-namenode
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_cloudera-{{ version }}-server
      - salt:      state_sls_hadoop-hdfs-journalnode
      - salt:      state_sls_hadoop-hdfs-secondarynamenode
      - salt:      state_sls_hadoop-hdfs-datanode

state_sls_hadoop-hdfs-namenode_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:hadoop-hdfs-namenode'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['hadoop-hdfs-namenode']}
    - require:
      - salt:      state_sls_hadoop-hdfs-namenode
