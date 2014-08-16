# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_collectd:
  salt.state:
    - tgt:         roles:collectd
    - tgt_type:    grain
    - sls:         collectd
    - require:
      - salt:      state_sls_salt-minion

state_sls_collectd_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:collectd'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['collectd']}
    - require:
      - salt:      state_sls_collectd
