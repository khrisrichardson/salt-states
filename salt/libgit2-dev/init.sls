# vi: set ft=yaml.jinja :

{% from  'libgit2-dev/map.jinja'
   import libgit2_dev
   with   context %}

libgit2-dev:
  pkg.latest:
    - name:     {{ libgit2_dev['pkg']['name'] }}
