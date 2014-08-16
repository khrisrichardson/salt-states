# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_memcached:
  salt.state:
    - tgt:         roles:memcached
    - tgt_type:    grain
    - sls:         memcached
    - require:
      - salt:      state_sls_salt-minion

state_sls_memcached_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:memcached'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['memcached']}
    - require:
      - salt:      state_sls_memcached
