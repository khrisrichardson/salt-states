# vi: set ft=yaml.jinja :

{% from 'redis-server/map.jinja' import map with context %}

include:
  -  procps

redis-server:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       redis-server

/etc/redis/redis.conf:
  file.replace:
    - name:     {{ map.get('/etc/redis/redis.conf', {}).get('file', {}).get('name') }}
    - pattern:   '^bind 127.0.0.1'
    - repl:      '#bind ${HOST}'
    - watch:
      - pkg:       redis-server
    - watch_in:
      - service:   redis-server

{% if not salt['config.get']('virtual_subtype') == 'Docker' %}

vm.overcommit_memory:
  sysctl.present:
    - value:       1
    - require:
      - pkg:       procps

{% endif %}
