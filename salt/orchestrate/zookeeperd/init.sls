# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_zookeeperd:
  salt.state:
    - tgt:         roles:zookeeperd
    - tgt_type:    grain
    - sls:         zookeeperd
    - require:
      - salt:      state_sls_salt-minion

state_sls_zookeeperd_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:zookeeperd'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['zookeeperd']}
    - require:
      - salt:      state_sls_zookeeperd
