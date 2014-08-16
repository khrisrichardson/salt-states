# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}

include:
  -  orchestrate.salt-minion

state_sls_gunicorn:
  salt.state:
    - tgt:         roles:gunicorn
    - tgt_type:    grain
    - sls:         gunicorn
    - require:
      - salt:      state_sls_salt-minion

state_sls_gunicorn_orchestrate:
  salt.state:
    - tgt:        'G@environment:{{ environment }} and not G@roles:gunicorn'
    - tgt_type:    compound
    - sls:         orchestrate
    - pillar:
        related: {'roles': ['gunicorn']}
    - require:
      - salt:      state_sls_gunicorn
