# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_influxdb:
  salt.state:
    - tgt:         roles:influxdb
    - tgt_type:    grain
    - sls:         influxdb
    - require:
      - salt:      state_sls_salt-minion

state_sls_influxdb_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:influxdb'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['influxdb']}
    - require:
      - salt:      state_sls_influxdb
