# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_socks5:
  salt.state:
    - tgt:         roles:socks5
    - tgt_type:    grain
    - sls:         socks5
    - require:
      - salt:      state_sls_salt-minion

state_sls_socks5_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:socks5'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['socks5']}
    - require:
      - salt:      state_sls_socks5
