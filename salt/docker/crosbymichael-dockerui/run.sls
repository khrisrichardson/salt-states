# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.pull

docker run crosbymichael/dockerui:
  docker.installed:
    - name:        dockerui
    - image:       crosbymichael/dockerui
    - volumes:
      - /var/run/docker.sock
    - watch:
      - docker:    docker pull crosbymichael/dockerui
