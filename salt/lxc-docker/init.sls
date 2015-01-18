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
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/default/docker
    - name:     {{ map.get('/etc/default/docker', {}).get('file', {}).get('name') }}
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       lxc-docker
    - watch_in:
      - service:   lxc-docker
