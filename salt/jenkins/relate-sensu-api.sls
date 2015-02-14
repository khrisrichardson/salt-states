# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('sensu-api') %}
{% set test    = salt['pillar.get']('test') or salt['environ.get']('test') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  ruby-jenkins_api_client
  -  sensu-client

{% if minions['sensu-api'] or test %}

extend:
  ruby-jenkins_api_client:
    gem.installed:
      - gem_bin:  /opt/sensu/embedded/bin/gem
      - require:
        - pkg:     sensu

/etc/sensu/conf.d/checks-{{ psls }}.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/sensu/conf.d/checks-{{ psls }}.json
    - user:        sensu
    - group:       sensu
    - mode:       '0440'
    - require:
      - file:     /etc/sensu/conf.d
    - watch_in:
      - file:     /etc/sensu/conf.d/client.json
      - service:   sensu-client

{% else %}

/etc/sensu/conf.d/checks-{{ psls }}.json:
  file.absent:
    - watch_in:
      - file:     /etc/sensu/conf.d/client.json
      - service:   sensu-client

{% endif %}
