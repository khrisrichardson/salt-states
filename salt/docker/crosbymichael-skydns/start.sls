# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run

docker start skydns:
  docker.running:
    - container:   skydns
    - lxc_conf:    []
    - port_bindings:
        '53/udp':
            HostIp:    '172.17.42.1'
            HostPort:  '53'
    - watch:
      - docker:    docker run crosbymichael/skydns
