# vi: set ft=yaml.jinja :

{% from 'salt-ssh/map.jinja' import map with context %}

salt-ssh:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}

/etc/salt/roster:
  file.managed:
    - source:      salt://{{ sls }}/etc/salt/roster
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-ssh
