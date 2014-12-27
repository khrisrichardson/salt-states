# vi: set ft=yaml.jinja :

{% from 'lxc-docker/map.jinja' import map with context %}

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
    - name:     {{ map.get('pkg', {}).get('name') }}
   {% if   salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   epel
   {% elif salt['config.get']('os_family') == 'Debian' %}
    - require:
      - pkgrepo:   lxc-docker
   {% endif %}
  service.running:
    - name:        docker
    - enable:      True
    - watch:
      - pkg:       lxc-docker

/etc/default/docker:
  file.replace:
    - name:     {{ map.get('/etc/default/docker', {}).get('file', {}).get('name') }}
    - pattern:  '^#DOCKER_OPTS=".*"$'
    - repl:       'DOCKER_OPTS="-dns 172.17.42.1 -dns 8.8.8.8"'
    - watch:
      - pkg:       lxc-docker
    - watch_in:
      - service:   lxc-docker
