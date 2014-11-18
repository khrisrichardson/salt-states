# vi: set ft=yaml.jinja :

{% from  'npm/map.jinja'
   import npm
   with   context %}

include:
  -  dnsutils
  -  netbase
  -  node-supervisor
  -  npm

giraffe-web:
  npm.installed:
    - require:
      - pkg:       npm
      - cmd:       npm config set ca ""

/usr/local/lib/node_modules/giraffe-web/dashboards.js:
  file.managed:
    - name:     {{ npm['/usr/local/lib/node_modules']['file']['name'] }}/giraffe-web/dashboards.js
    - template:    jinja
    - source:      salt://{{ sls }}/usr/local/lib/node_modules/giraffe-web/dashboards.js
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       dnsutils
      - host:      127.0.0.1
      - host:      127.0.1.1
      - npm:       giraffe-web

#-------------------------------------------------------------------------------
# TODO: compare to CSS files in git
#-------------------------------------------------------------------------------

/usr/local/lib/node_modules/giraffe-web/vendor/giraffe/css/legend.css:
  file.managed:
    - name:     {{ npm['/usr/local/lib/node_modules']['file']['name'] }}/giraffe-web/vendor/giraffe/css/legend.css
    - template:    jinja
    - source:      salt://{{ sls }}/usr/local/lib/node_modules/giraffe-web/vendor/giraffe/css/legend.css
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - npm:       giraffe-web

/usr/local/lib/node_modules/giraffe-web/vendor/giraffe/css/main.css:
  file.managed:
    - name:     {{ npm['/usr/local/lib/node_modules']['file']['name'] }}/giraffe-web/vendor/giraffe/css/main.css
    - template:    jinja
    - source:      salt://{{ sls }}/usr/local/lib/node_modules/giraffe-web/vendor/giraffe/css/main.css
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - npm:       giraffe-web

/usr/local/lib/node_modules/giraffe-web/bin/supervisor:
  cmd.script:
    - name:     {{ npm['/usr/local/lib/node_modules']['file']['name'] }}/giraffe-web/bin/supervisor
    - template:    jinja
    - source:      salt://{{ sls }}/usr/local/lib/node_modules/giraffe-web/bin/supervisor
    - unless:      ps -C node
    - require:
      - pkg:       dnsutils
      - host:      127.0.0.1
      - host:      127.0.1.1
      - npm:       giraffe-web
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - pkg:       nodejs-supervisor
     {% elif salt['config.get']('os_family') == 'Debian' %}
      - npm:       npm-supervisor
     {% endif %}
      - file:     /usr/local/lib/node_modules/giraffe-web/dashboards.js
