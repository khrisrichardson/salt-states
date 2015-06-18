# vi: set ft=yaml.jinja :

{% from 'nginx-common/map.jinja' import map with context %}

{% set psls = sls.split('.')[0] %}

include:
  -  kube-apiserver
  -  nginx

/etc/nginx/sites-available/{{ psls }}:
  file.managed:
    - template:    jinja
    - name:     {{ map.get('/etc/nginx/sites-available', {}).get('file', {}).get('name') }}/{{ psls }}{{ map.get('conf', {}).get('extension') }}
    - source:      salt://{{ psls }}/etc/nginx/sites-available/{{ psls }}
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       nginx
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
