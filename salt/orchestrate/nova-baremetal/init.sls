# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-baremetal:
  salt.state:
    - tgt:         roles:nova-baremetal
    - tgt_type:    grain
    - sls:         nova-baremetal
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-baremetal_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-baremetal'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-baremetal']}
    - require:
      - salt:      state_sls_nova-baremetal
