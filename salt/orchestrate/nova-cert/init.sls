# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-cert:
  salt.state:
    - tgt:         roles:nova-cert
    - tgt_type:    grain
    - sls:         nova-cert
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-cert_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-cert'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-cert']}
    - require:
      - salt:      state_sls_nova-cert
