# vi: set ft=yaml.jinja :

{% from  'mongodb-server/map.jinja'
   import mongodb_server
   with   context %}

mongodb-server:
  pkg.installed:   []
  service.running:
    - name:     {{ mongodb_server['service']['name'] }}
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       mongodb-server

/etc/mongodb.conf:
  file.replace:
    - pattern:   '^bind_ip = 127.0.0.1'
    - repl:       'bind_ip = 0.0.0.0'
    - watch:
      - pkg:       mongodb-server
    - watch_in:
      - service:   mongodb-server

/var/lib/mongodb:
  file.directory:
    - user:        mongodb
    - group:       mongodb
    - mode:       '0755'
    - require:
      - pkg:       mongodb-server
    - require_in:
      - service:   mongodb-server

/var/log/mongodb:
  file.directory:
    - user:        mongodb
    - group:       mongodb
    - mode:       '0755'
    - require:
      - pkg:       mongodb-server
    - require_in:
      - service:   mongodb-server

/var/run/mongodb:
  file.directory:
    - user:        mongodb
    - group:       mongodb
    - mode:       '0755'
    - require:
      - pkg:       mongodb-server
    - require_in:
      - service:   mongodb-server
