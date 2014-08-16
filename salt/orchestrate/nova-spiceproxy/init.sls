# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-spiceproxy:
  salt.state:
    - tgt:         roles:nova-spiceproxy
    - tgt_type:    grain
    - sls:         nova-spiceproxy
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-spiceproxy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-spiceproxy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-spiceproxy']}
    - require:
      - salt:      state_sls_nova-spiceproxy
