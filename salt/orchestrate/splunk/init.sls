# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_splunk:
  salt.state:
    - tgt:         roles:splunk
    - tgt_type:    grain
    - sls:         splunk
    - require:
      - salt:      state_sls_salt-minion

state_sls_splunk_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:splunk'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['splunk']}
    - require:
      - salt:      state_sls_splunk
