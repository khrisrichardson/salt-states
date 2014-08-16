# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_php5-fpm:
  salt.state:
    - tgt:         roles:php5-fpm
    - tgt_type:    grain
    - sls:         php5-fpm
    - require:
      - salt:      state_sls_salt-minion

state_sls_php5-fpm_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:php5-fpm'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['php5-fpm']}
    - require:
      - salt:      state_sls_php5-fpm
