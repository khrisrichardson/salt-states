# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_hadoop-hdfs:
  salt.state:
    - tgt:         roles:hadoop-hdfs
    - tgt_type:    grain
    - sls:         hadoop-hdfs
    - require:
      - salt:      state_sls_salt-minion

state_sls_hadoop-hdfs_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:hadoop-hdfs'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['hadoop-hdfs']}
    - require:
      - salt:      state_sls_hadoop-hdfs
