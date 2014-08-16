# vi: set ft=yaml.jinja :

{% set minions = salt['roles.dict']('postgresql') %}

include:
  -  descartes
  -  postgresql

{% if minions['postgresql'] %}

createdb descartes:
  cmd.run:
    - cwd:        /opt/descartes
    - user:        postgres
#   - unless:
    - require:
      - pkg:       postgresql
      - git:       https://github.com/obfuscurity/descartes.git

bundle exec rake db:migrate:up:
  cmd.run:
    - cwd:        /opt/descartes
    - user:        postgres
#   - unless:
    - require:
      - pkg:       postgresql
      - cmd:       createdb descartes

{% endif %}
