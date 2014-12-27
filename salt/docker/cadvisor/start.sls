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
        /sys/fs/cgroup:
          bind:        /cgroup
          ro:           true
        /var/lib/docker:
          bind:        /var/lib/docker
          ro:           true
        /var/run:
          bind:        /var/run
          ro:           false
   {% endif %}
    - links:       []
    - lxc_conf:    []
    - port_bindings:
        '8080/tcp':
            HostIp:    '0.0.0.0'
            HostPort:  '8080'
    - watch:
      - docker:    docker run {{ psls }}
