# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment', 'base') %}
{% set psls        = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.pull

docker run crosbymichael/skydock:
  docker.installed:
    - name:        skydock
    - image:       crosbymichael/skydock
    - command:    -domain 'skydns.local.' -environment {{ environment }} -ttl 30
    - volumes:
      - /var/run/docker.sock
    - watch:
      - docker:    docker pull crosbymichael/skydock
