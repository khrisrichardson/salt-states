# vi: set ft=yaml.jinja :

{% set ipv4 = salt['config.get']('fqdn_ip4') %}
{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.build

docker run {{ psls }}:
  docker.installed:
    - name:     {{ psls }}
    - image:    {{ psls }}:latest
    - command:    -name {{ psls }} -addr {{ ipv4[0] }}:4001 -peer-addr {{ ipv4[0] }}:7001
    - watch:
      - docker:    docker build {{ psls }}
