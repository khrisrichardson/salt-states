# vi: set ft=yaml.jinja :

include:
  -  g++
  -  make
  -  ruby-dev

ruby-redmon:
  gem.installed:
    - name:        redmon
    - require:
      - pkg:       g++
      - pkg:       make
      - pkg:       ruby-dev
