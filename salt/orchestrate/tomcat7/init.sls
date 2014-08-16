# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_tomcat7:
  salt.state:
    - tgt:         roles:tomcat7
    - tgt_type:    grain
    - sls:         tomcat7
    - require:
      - salt:      state_sls_salt-minion

state_sls_tomcat7_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:tomcat7'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['tomcat7']}
    - require:
      - salt:      state_sls_tomcat7
