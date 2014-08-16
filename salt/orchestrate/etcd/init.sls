# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_etcd:
  salt.state:
    - tgt:         roles:etcd
    - tgt_type:    grain
    - sls:         etcd
    - require:
      - salt:      state_sls_salt-minion

state_sls_etcd_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:etcd'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['etcd']}
    - require:
      - salt:      state_sls_etcd
