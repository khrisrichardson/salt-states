# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.ubuntu.pull

/usr/local/src/salt-minion/Dockerfile:
  file.managed:
    - source:      salt://{{ psls }}/Dockerfile
    - user:        root
    - group:       root
    - mode:       '0644'
    - makedirs:    True

/usr/local/src/salt-minion/bootstrap.sh:
  file.managed:
    - source:      salt://{{ psls }}/bootstrap.sh
    - user:        root
    - group:       root
    - mode:       '0644'
    - makedirs:    True

docker build {{ psls }}:
  docker.built:
    - name:     {{ psls }}
    - path:       /usr/local/src/salt-minion
   {% if  salt['config.get']('force')|lower == 'true'
      or salt['environ.get']('force')|lower == 'true' %}
    - force:       True
   {% endif %}
    - watch:
      - docker:    docker pull ubuntu
      - file:     /usr/local/src/salt-minion/Dockerfile
      - file:     /usr/local/src/salt-minion/bootstrap.sh
