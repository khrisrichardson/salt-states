# vi: set ft=yaml.jinja :

{% from  'apache2/map.jinja'
   import apache2
   with   context %}

{% set environment = salt['grains.get']('environment') %}
{% set minions     = salt['mine.get']('environment:' + environment, 'grains.item', expr_form='grain') %}
{% set group       = apache2['group']['name'] %}
{% set user        = apache2['user']['name'] %}

include:
  -  apache2
  -  tasseo

extend:
{% for minion in minions %}
  /opt/tasseo/dashboards/{{ minion }}.js:
    file:
      - user:   {{ user }}
      - group:  {{ group }}
      - require:
        - pkg:     apache2
{% endfor %}

  /opt/tasseo/lib/tasseo/public/c/style.css:
    file.managed:
      - user:   {{ user }}
      - group:  {{ group }}
      - require:
        - pkg:     apache2

  rvm use 1.9.2:
    cmd:
      - user:   {{ user }}
      - require:
        - pkg:     apache2

  bundle install && gem install foreman:
    cmd:
      - user:   {{ user }}
      - require:
        - pkg:     apache2

usermod -G rvm {{ user }}:
  cmd.run:
    - unless:    |-
                 ( id    -Gn {{ user }}                                        \
                 | egrep -q rvm
                 )
    - require:
      - pkg:       apache2
