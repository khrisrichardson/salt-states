# vi: set ft=yaml.jinja :

include:
  -  sensu-server

sensu-api:
{% if salt['environ.get']('bootstrap') == 'true' %}
  service.dead:
    - enable:      False
{% else %}
  service.running:
    - enable:      True
{% endif %}
    - watch:
      - service:   sensu-server
