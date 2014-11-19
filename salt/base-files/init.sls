# vi: set ft=yaml.jinja :

{% from 'base-files/map.jinja' import map with context %}

base-files:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}

/tmp:
  file.directory:
    - user:        root
    - group:       root
    - mode:       '1777'
    - require:
      - pkg:       base-files
