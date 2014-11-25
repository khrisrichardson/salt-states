# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.build

docker run {{ psls }}:
  docker.installed:
    - name:     {{ psls }}
    - image:    {{ psls }}:latest
    - volumes:
      - /srv/pillar
      - /srv/reactor
      - /srv/salt
    - watch:
      - docker:    docker build {{ psls }}
