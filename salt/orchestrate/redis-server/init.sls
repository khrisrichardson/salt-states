# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_redis-server:
  salt.state:
    - tgt:         roles:redis-server
    - tgt_type:    grain
    - sls:         redis-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_redis-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:redis-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['redis-server']}
    - require:
      - salt:      state_sls_redis-server
