# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start

docker start {{ psls }}:
{% if salt['ps.pgrep']('docker') %}
  docker.running:
    - container:     {{ psls }}
    - binds:
        /var/cache/apt-cacher-ng:
          bind:        /var/cache/apt-cacher-ng
          ro:           false
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
{% else %}
  docker.absent:   []
{% endif %}
