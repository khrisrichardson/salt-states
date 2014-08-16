# vi: set ft=yaml.jinja :

{% set environment =  salt['grains.get']('environment') %}
{% set version     = 'cm4' %}

include:
  -  orchestrate.salt-minion
  -  orchestrate.cloudera-{{ version }}-server

state_sls_hadoop-hdfs-secondarynamenode:
  salt.state:
    - tgt:         roles:hadoop-hdfs-secondarynamenode
    - tgt_type:    grain
    - sls:         hadoop-hdfs-secondarynamenode
    - require:
      - salt:      state_sls_salt-minion
      - salt:      state_sls_cloudera-{{ version }}-server

state_sls_hadoop-hdfs-secondarynamenode_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:hadoop-hdfs-secondarynamenode'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['hadoop-hdfs-secondarynamenode']}
    - require:
      - salt:      state_sls_hadoop-hdfs-secondarynamenode
