# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.salt-minion.build

/usr/local/src/{{ psls }}/Dockerfile:
  file.managed:
    - source:      salt://{{ psls }}/Dockerfile
    - user:        root
    - group:       root
    - mode:       '0644'
    - makedirs:    True

/usr/local/src/{{ psls }}/etc/salt/grains:
  file.managed:
    - source:      salt://{{ psls }}/etc/salt/grains
    - user:        root
    - group:       root
    - mode:       '0644'
    - makedirs:    True

docker build {{ psls }}:
  docker.built:
    - name:     {{ psls }}
    - path:       /usr/local/src/{{ psls }}
   {% if  salt['config.get']('force')|lower == 'true'
      or salt['environ.get']('force')|lower == 'true' %}
    - force:       True
   {% endif %}
    - watch:
      - docker:    docker build salt-minion
      - file:     /usr/local/src/{{ psls }}/Dockerfile
      - file:     /usr/local/src/{{ psls }}/etc/salt/grains
