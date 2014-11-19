# vi: set ft=yaml.jinja :

{% from 'apache2/map.jinja' import map with context %}

include:
  - .depend-git
  -  ruby-rvm

usermod -G rvm  {{ map.get('user', {}).get('name') }}:
  cmd.run:
    - unless:    |-
                 ( id    -Gn {{ map.get('user', {}).get('name') }}             \
                 | egrep -q rvm
                 )
    - require:
      - pkg:       apache2
