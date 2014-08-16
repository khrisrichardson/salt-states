# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_mesos-master:
  salt.state:
    - tgt:         roles:mesos-master
    - tgt_type:    grain
    - sls:         mesos-master
    - require:
      - salt:      state_sls_salt-minion

state_sls_mesos-master_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:mesos-master'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['mesos-master']}
    - require:
      - salt:      state_sls_mesos-master
