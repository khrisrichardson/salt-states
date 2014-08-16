# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_coreos-ipxe-server:
  salt.state:
    - tgt:         roles:coreos-ipxe-server
    - tgt_type:    grain
    - sls:         coreos-ipxe-server
    - require:
      - salt:      state_sls_salt-minion

state_sls_coreos-ipxe-server_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:coreos-ipxe-server'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['coreos-ipxe-server']}
    - require:
      - salt:      state_sls_coreos-ipxe-server
