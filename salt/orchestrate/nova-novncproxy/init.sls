# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-novncproxy:
  salt.state:
    - tgt:         roles:nova-novncproxy
    - tgt_type:    grain
    - sls:         nova-novncproxy
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-novncproxy_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-novncproxy'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-novncproxy']}
    - require:
      - salt:      state_sls_nova-novncproxy
