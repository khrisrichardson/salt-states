# vi: set ft=yaml.jinja :

{% from  'salt-ssh/map.jinja'
   import salt_ssh
   with   context %}

salt-ssh:
  pkg.installed:
    - name:     {{ salt_ssh['pkg']['name'] }}

/etc/salt/roster:
  file.managed:
    - source:      salt://{{ sls }}/etc/salt/roster
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       salt-ssh
