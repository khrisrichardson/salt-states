# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-compute-xen:
  salt.state:
    - tgt:         roles:nova-compute-xen
    - tgt_type:    grain
    - sls:         nova-compute-xen
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-compute-xen_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-compute-xen'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-compute-xen']}
    - require:
      - salt:      state_sls_nova-compute-xen
