# vi: set ft=yaml.jinja :

{% from  'mysql-common/map.jinja'
   import mysql_common
   with   context %}

mysql-common:
  pkg.installed:
    - name:     {{ mysql_common['pkg']['name'] }}

/etc/mysql/my.cnf:
  file.managed:
    - template:    jinja
    - name:     {{ mysql_common['/etc/mysql/my.cnf']['file']['name'] }}
    - source:      salt://{{ sls }}/etc/mysql/my.cnf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       mysql-common
