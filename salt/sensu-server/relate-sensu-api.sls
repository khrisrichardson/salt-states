# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('sensu-api') %}
{% set test    = salt['pillar.get']('test') or salt['environ.get']('test') %}
{% set psls    = sls.split('.')[0] %}

include:
  -  ruby-rest-client
  -  sensu-client

{% if minions['sensu-api'] or test %}

extend:
  ruby-rest-client:
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

/etc/sensu/conf.d/sensu-api.json:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/sensu/conf.d/sensu-api.json
    - user:        sensu
    - group:       sensu
    - mode:       '0444'
    - require:
      - file:     /etc/sensu/conf.d
    - watch_in:
      - service:   sensu-server

{% else %}

/etc/sensu/conf.d/checks-{{ psls }}.json:
  file.absent:
    - watch_in:
      - file:     /etc/sensu/conf.d/client.json
      - service:   sensu-client

/etc/sensu/conf.d/sensu-api.json:
  file:
    - absent
    - watch_in:
      - service:   sensu-server

{% endif %}
