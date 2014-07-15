# vi: set ft=yaml.jinja :

include:
  -  python-apt

lxc-docker:
  pkgrepo.managed:
    - name:        deb http://get.docker.io/ubuntu docker main
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       36A1D7869245C8950F966E92D8576A8BA88D21E9
    - require:
      - pkg:       python-apt
  pkg.installed:
    - name:     {{ salt['config.get']('lxc-docker:pkg:name') }}
    - require:
      - pkgrepo:   lxc-docker
  service.running:
    - name:        docker
    - enable:      True
    - watch:
      - pkg:       lxc-docker

/etc/default/docker:
  file.replace:
    - name:     {{ salt['config.get']('/etc/default/docker:file:name') }}
    - pattern:  '^#DOCKER_OPTS=".*"$'
    - repl:       'DOCKER_OPTS="-dns 172.17.42.1 -dns 8.8.8.8"'
    - watch:
      - pkg:       lxc-docker
    - watch_in:
      - service:   lxc-docker
