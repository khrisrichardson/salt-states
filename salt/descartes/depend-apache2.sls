# vi: set ft=yaml.jinja :

{% from 'apache2/map.jinja' import map with context %}

include:
  -  apache2
  -  descartes

extend:
  rvm use 1.9.3:
    cmd:
      - user:   {{ map.get('user', {}).get('name') }}
      - require:
        - pkg:     apache2

  bundle install && gem install foreman:
    cmd:
      - user:     {{ map.get('user', {}).get('name') }}
      - require:
        - pkg:       apache2

usermod -G rvm {{ map.get('user', {}).get('name') }}:
  cmd.run:
    - unless:    |-
                 ( id    -Gn {{ map.get('user', {}).get('name') }}             \
                 | egrep -q rvm
                 )
    - require:
      - pkg:       apache2
      - cmd:       curl https://get.rvm.io
