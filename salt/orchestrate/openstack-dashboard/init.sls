# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_openstack-dashboard:
  salt.state:
    - tgt:         roles:openstack-dashboard
    - tgt_type:    grain
    - sls:         openstack-dashboard
    - require:
      - salt:      state_sls_salt-minion

state_sls_openstack-dashboard_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:openstack-dashboard'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['openstack-dashboard']}
    - require:
      - salt:      state_sls_openstack-dashboard
