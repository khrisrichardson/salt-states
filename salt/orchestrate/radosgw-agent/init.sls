# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_radosgw-agent:
  salt.state:
    - tgt:         roles:radosgw-agent
    - tgt_type:    grain
    - sls:         radosgw-agent
    - require:
      - salt:      state_sls_salt-minion

state_sls_radosgw-agent_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:radosgw-agent'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['radosgw-agent']}
    - require:
      - salt:      state_sls_radosgw-agent
