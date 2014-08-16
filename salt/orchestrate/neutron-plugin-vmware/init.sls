# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_neutron-plugin-vmware:
  salt.state:
    - tgt:         roles:neutron-plugin-vmware
    - tgt_type:    grain
    - sls:         neutron-plugin-vmware
    - require:
      - salt:      state_sls_salt-minion

state_sls_neutron-plugin-vmware_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:neutron-plugin-vmware'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['neutron-plugin-vmware']}
    - require:
      - salt:      state_sls_neutron-plugin-vmware
