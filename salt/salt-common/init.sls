# vi: set ft=yaml.jinja :

{% from 'salt-common/map.jinja' import map with context %}

include:
  - .depend-supervisor
  -  bash
  {% if salt['config.get']('os_family') == 'RedHat' %}
  -  epel-release
  {% endif %}

salt-common:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
    - enablerepo:  epel-testing
    - unless:    |-
                 ( salt-call   --version                                       \
                 | egrep -q '....\..\..+-'
                 )
   {% if salt['config.get']('os_family') == 'RedHat' %}
    - require:
      - pkgrepo:   epel-testing
   {% endif %}

salt:
  group.present:
    - gid:         501
  user.present:
    - fullname:    Salt
    - home:       /home/salt
    - shell:      /bin/bash
    - createhome:  True
    - password:    $1$9bVX1pEh$sp2ceLpbAzBqEknNeu2yv1
    - gid:         501
    - uid:         501
    - require:
      - pkg:       bash
      - group:     salt
