# vi: set ft=yaml.jinja :

{% from  'apache2/map.jinja'
   import apache2
   with   context %}

include:
  -  apache2
  -  descartes

extend:
  rvm use 1.9.3:
    cmd:
      - user:   {{ apache2['user']['name'] }}
      - require:
        - pkg:     apache2

  bundle install && gem install foreman:
    cmd:
      - user:     {{ apache2['user']['name'] }}
      - require:
        - pkg:       apache2

usermod -G rvm {{ apache2['user']['name'] }}:
  cmd.run:
    - unless:    |-
                 ( id    -Gn {{ apache2['user']['name'] }}                     \
                 | egrep -q rvm
                 )
    - require:
      - pkg:       apache2
