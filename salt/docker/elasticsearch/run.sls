# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.build

docker run {{ psls }}:
  docker.installed:
    - name:     {{ psls }}
    - image:    {{ psls }}:latest
   {% if salt['ps.pgrep']('docker') %}
    - volumes:
      - /var/cache/{{ psls }}
   {% endif %}
    - watch:
      - docker:    docker build {{ psls }}
