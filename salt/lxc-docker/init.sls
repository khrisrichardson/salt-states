# vi: set ft=yaml.jinja :

{% from  'lxc-docker/map.jinja'
   import lxc_docker
   with   context %}

include:
  -  python-apt
  {% if salt['config.get']('os_family') == 'RedHat' %}
  -  epel-release
  {% endif %}

lxc-docker:
{% if salt['config.get']('os_family') == 'Debian' %}
  pkgrepo.managed:
    - name:        deb http://get.docker.io/ubuntu docker main
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - keyid:       36A1D7869245C8950F966E92D8576A8BA88D21E9
    - require:
      - pkg:       python-apt
{% endif %}
  pkg.installed:
    - name:     {{ lxc_docker['pkg']['name'] }}
    - require:
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - pkgrepo:   epel
     {% elif salt['config.get']('os_family') == 'Debian' %}
      - pkgrepo:   lxc-docker
     {% endif %}
  service.running:
    - name:        docker
    - enable:      True
    - watch:
      - pkg:       lxc-docker

/etc/default/docker:
  file.replace:
    - name:     {{ lxc_docker['/etc/default/docker']['file']['name'] }}
    - pattern:  '^#DOCKER_OPTS=".*"$'
    - repl:       'DOCKER_OPTS="-dns 172.17.42.1 -dns 8.8.8.8"'
    - watch:
      - pkg:       lxc-docker
    - watch_in:
      - service:   lxc-docker
