# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
    - binds:
        /var/cache/apt-cacher-ng:     /var/cache/apt-cacher-ng
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - port_bindings:
        '3142/tcp':
            HostIp:    '0.0.0.0'
            HostPort:  '3142'
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
