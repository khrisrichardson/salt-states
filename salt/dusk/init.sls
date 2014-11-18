# vi: set ft=yaml.jinja :

{% from  'apache2/map.jinja'
   import apache2
   with   context %}

include:
  - .depend-git
  -  ruby-rvm

usermod -G rvm  {{ apache2['user']['name'] }}:
  cmd.run:
    - unless:    |-
                 ( id    -Gn {{ apache2['user']['name'] }}                     \
                 | egrep -q rvm
                 )
    - require:
      - pkg:       apache2
