# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_mesos-slave:
  salt.state:
    - tgt:         roles:mesos-slave
    - tgt_type:    grain
    - sls:         mesos-slave
    - require:
      - salt:      state_sls_salt-minion

state_sls_mesos-slave_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:mesos-slave'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['mesos-slave']}
    - require:
      - salt:      state_sls_mesos-slave
