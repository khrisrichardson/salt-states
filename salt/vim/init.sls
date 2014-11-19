# vi: set ft=yaml.jinja :

{% from 'vim/map.jinja' import map with context %}

vim:
  pkg.installed:
    - order:      -1
    - name:     {{ map.get('pkg', {}).get('name') }}

/etc/skel/.vimrc:
  file.managed:
    - order:      -1
    - source:      salt://{{ sls }}/etc/skel/.vimrc
    - user:        root
    - group:       root
    - mode:       '0644'

/root/.vimrc:
  file.managed:
    - order:      -1
    - source:      salt://{{ sls }}/etc/skel/.vimrc
    - user:        root
    - group:       root
    - mode:       '0644'
