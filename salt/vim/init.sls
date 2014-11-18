# vi: set ft=yaml.jinja :

{% from  'vim/map.jinja'
   import vim
   with   context %}

vim:
  pkg.installed:
    - order:      -1
    - name:     {{ vim['pkg']['name'] }}

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
