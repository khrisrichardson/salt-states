# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.pull

docker run registry:
  docker.installed:
    - name:        registry
    - image:       registry:latest
   {% if salt['ps.pgrep']('docker') %}
    - volumes:
      - /tmp/registry
   {% endif %}
    - watch:
      - docker:    docker pull registry
