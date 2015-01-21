# vi: set ft=yaml.jinja :

{% from 'apache2/map.jinja' import map with context %}

{% set user = map.get('user', {}).get('name') %}

include:
  -  apache2
  -  dusk

usermod -G rvm {{ user }}:
  cmd.run:
    - unless:    |-
                 ( id    -Gn {{ user }}                                        \
                 | egrep -q rvm
                 )
    - require:
      - pkg:       apache2
      - cmd:       curl https://get.rvm.io
