# vi: set ft=yaml.jinja :

{% set date = salt['cmd.run']('date +%s') %}
{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.build

docker tag {{ psls }}:{{ date }}:
  module.run:
    - name:        docker.tag
    - image:       {{ psls }}:latest
    - repository:  {{ psls }}
    - tag:         {{ date }}
    - onchanges:
      - docker:    docker build {{ psls }}
