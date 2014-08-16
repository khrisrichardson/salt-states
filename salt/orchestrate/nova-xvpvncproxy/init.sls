# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-xvpvncproxy:
  salt.state:
    - tgt:         roles:nova-xvpvncproxy
    - tgt_type:    grain
    - sls:         nova-xvpvncproxy
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-xvpvncproxy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-xvpvncproxy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-xvpvncproxy']}
    - require:
      - salt:      state_sls_nova-xvpvncproxy
