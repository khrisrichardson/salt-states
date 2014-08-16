# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-console:
  salt.state:
    - tgt:         roles:nova-console
    - tgt_type:    grain
    - sls:         nova-console
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-console_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-console'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-console']}
    - require:
      - salt:      state_sls_nova-console
