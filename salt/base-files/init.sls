# vi: set ft=yaml.jinja :

{% from  'base-files/map.jinja'
   import base_files
   with   context %}

base-files:
  pkg.installed:
    - name:     {{ base_files['pkg']['name'] }}

/tmp:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '1777'
    - require:
      - pkg:       base-files
