# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.build

docker run {{ psls }}:
  docker.installed:
    - name:     {{ psls }}
    - image:    {{ psls }}:latest
    - environment:
        ETCD_MACHINES:  http://172.17.42.1:4001
    - watch:
      - docker:    docker build {{ psls }}
