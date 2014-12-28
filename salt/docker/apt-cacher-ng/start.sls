# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
   {% if salt['ps.pgrep']('docker') %}
    - binds:
        /var/cache/apt-cacher-ng:
          bind:        /var/cache/apt-cacher-ng
          ro:           false
   {% endif %}
    - links:       []
    - lxc_conf:    []
    - port_bindings:
        '3142/tcp':
            HostIp:    '0.0.0.0'
            HostPort:  '3142'
    - watch:
      - docker:    docker run {{ psls }}
