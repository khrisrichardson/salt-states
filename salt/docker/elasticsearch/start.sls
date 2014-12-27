# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[1] %}

include:
  -  python-docker
  -  docker.{{ psls }}.run
  -  docker.salt-master.start

docker start {{ psls }}:
  docker.running:
    - container:     {{ psls }}
   {% if salt['ps.pgrep']('docker') %}
    - binds:
        /var/cache/{{ psls }}:
          bind:        /var/cache/{{ psls }}
          ro:           false
   {% endif %}
    - links:
        salt-master:    salt
    - lxc_conf:    []
    - port_bindings:
        '9200/tcp':
            HostIp:    '0.0.0.0'
            HostPort:  '9200'
    - watch:
      - docker:    docker run {{ psls }}
      - docker:    docker start salt-master
