# vi: set ft=yaml.jinja :

{% from 'npm/map.jinja' import map with context %}

include:
  -  dnsutils
  -  netbase
  -  node-supervisor
  -  npm

redis-commander:
  npm.installed:
    - require:
      - pkg:       npm
      - cmd:       npm config set ca ""

/usr/local/lib/node_modules/redis-commander/bin/supervisor:
  cmd.script:
    - name:     {{ map.get('/usr/local/lib/node_modules', {}).get('file', {}).get('name') }}/redis-commander/bin/supervisor
    - template:    jinja
    - source:      salt://{{ sls }}/usr/local/lib/node_modules/redis-commander/bin/supervisor
    - unless:      ps -C node
    - require:
      - npm:       redis-commander
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - pkg:       nodejs-supervisor
     {% elif salt['config.get']('os_family') == 'Debian' %}
      - npm:       npm-supervisor
     {% endif %}
