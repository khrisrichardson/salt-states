# vi: set ft=yaml.jinja :

{% from 'mysql-common/map.jinja' import map with context %}

mysql-common:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}

/etc/mysql/my.cnf:
  file.managed:
    - template:    jinja
    - name:     {{ map.get('/etc/mysql/my.cnf', {}).get('file', {}).get('name') }}
    - source:      salt://{{ sls }}/etc/mysql/my.cnf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       mysql-common
