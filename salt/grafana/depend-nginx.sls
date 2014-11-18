# vi: set ft=yaml.jinja :

{% from  'nginx-common/map.jinja'
   import nginx_common
   with   context %}

{% set psls = sls.split('.')[0] %}

include:
  -  grafana
  -  nginx

extend:
  /usr/share/grafana/config.js:
    file:
      - watch_in:
        - service: nginx-common

# /usr/share/grafana/app/app.js:
#   file:
#     - watch_in:
#       - service: nginx-common

  /usr/share/grafana/app/dashboards/default.json:
    file:
      - watch_in:
        - service: nginx-common

/etc/nginx/sites-available/{{ psls }}:
  file.managed:
    - template:    jinja
    - name:     {{ nginx_common['/etc/nginx/sites-available']['file']['name'] }}/{{ psls }}{{ nginx_common['conf']['extension'] }}
    - source:      salt://{{ psls }}/etc/nginx/sites-available/{{ psls }}
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       nginx
      - file:     /usr/share/grafana
    - watch_in:
      - service:   nginx-common

/etc/nginx/sites-enabled/{{ psls }}:
  file.symlink:
    - target:     /etc/nginx/sites-available/{{ psls }}
    - onlyif:      test -d /etc/nginx/sites-enabled
    - require:
      - file:     /etc/nginx/sites-available/{{ psls }}
    - watch_in:
      - service:   nginx-common
