# vi: set ft=yaml.jinja :

{% from 'openssh-server/map.jinja' import map with context %}

{% set users = [] %}
{% do  users.append('krichardson') %}

openssh-server:
  pkg.installed:
    - order:      -1
  service.running:
    - name:     {{ map.get('service', {}).get('name') }}
    - enable:      True
    - reload:      True
    - sig:        /usr/sbin/sshd
    - watch:
      - pkg:       openssh-server

{% if salt['config.get']('virtual_subtype') == 'Docker' %}

/etc/ssh/sshd_config:
  file.replace:
   {% if   salt['config.get']('os_family') == 'RedHat' %}
    - pattern:  '^#UsePAM no'
    - repl:       'UsePAM yes'
   {% elif salt['config.get']('os_family') == 'Debian' %}
    - pattern:   '^UsePAM yes'
    - repl:       'UsePAM no'
   {% endif %}
    - watch_in:
      - service:   openssh-server

{% endif %}
{% for user in users %}

id_rsa.pub.{{ user }}:
  ssh_auth.present:
    - order:      -2
    - user:        root
    - source:      salt://{{ sls }}/root/.ssh/id_rsa.pub.{{ user }}

{% endfor %}
