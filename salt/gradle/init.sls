# vi: set ft=yaml.jinja :

gradle:
  pkg.installed:   []

/usr/bin/gradle:
  file.managed:
    - source:      salt://{{ sls }}/usr/bin/gradle
    - user:        root
    - group:       root
    - mode:       '0755'
    - watch:
      - pkg:       gradle
