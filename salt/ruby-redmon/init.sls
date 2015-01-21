# vi: set ft=yaml.jinja :

include:
  -  g++
  -  make
  -  ruby-dev

redmon:
  gem.installed:
    - onlyif:      which gem
    - require:
      - pkg:       g++
      - pkg:       make
      - pkg:       ruby-dev
