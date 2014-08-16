# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-consoleauth:
  salt.state:
    - tgt:         roles:nova-consoleauth
    - tgt_type:    grain
    - sls:         nova-consoleauth
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-consoleauth_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-consoleauth'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-consoleauth']}
    - require:
      - salt:      state_sls_nova-consoleauth
