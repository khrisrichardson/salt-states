# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_nova-api-ec2:
  salt.state:
    - tgt:         roles:nova-api-ec2
    - tgt_type:    grain
    - sls:         nova-api-ec2
    - require:
      - salt:      state_sls_salt-minion

state_sls_nova-api-ec2_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:nova-api-ec2'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['nova-api-ec2']}
    - require:
      - salt:      state_sls_nova-api-ec2
