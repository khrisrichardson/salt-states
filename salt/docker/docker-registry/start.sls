# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run

docker start registry:
  docker.running:
    - container:   registry
   {% if salt['ps.pgrep']('docker') %}
    - binds:
        /srv/docker/registry:
          bind:    /tmp/registry
          ro:       false
   {% endif %}
    - lxc_conf:    []
    - port_bindings:
        '5000/tcp':
            HostIp:    '0.0.0.0'
            HostPort:  '5000'
    - watch:
      - docker:    docker run registry
