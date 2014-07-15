# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run

docker start dockerui:
  docker.running:
    - container:   dockerui
    - binds:
        /var/run/docker.sock:    /var/run/docker.sock
    - lxc_conf:    []
    - port_bindings:
        '9000/tcp':
            HostIp:    '0.0.0.0'
            HostPort:  '9000'
    - watch:
      - docker:    docker run crosbymichael/dockerui
