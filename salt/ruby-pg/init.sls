# vi: set ft=yaml.jinja :

include:
  -  libpq-dev

ruby-pg:
  gem.installed:
    - name:        pg
    - require:
      - pkg:       libpq-dev
