# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}
{% set minions     = salt['mine.get']('environment:' + environment, 'grains.item', expr_form='grain') %}

include:
  -  apache2
  -  tasseo

extend:
{% for minion in minions %}
  /opt/tasseo/dashboards/{{ minion }}.js:
    file:
      - user:   {{ salt['config.get']('apache2:user:name') }}
      - group:  {{ salt['config.get']('apache2:group:name') }}
      - require:
        - pkg:     apache2
{% endfor %}

  /opt/tasseo/lib/tasseo/public/c/style.css:
    file.managed:
      - user:   {{ salt['config.get']('apache2:user:name') }}
      - group:  {{ salt['config.get']('apache2:group:name') }}
      - require:
        - pkg:     apache2

  rvm use 1.9.2:
    cmd:
      - user:   {{ salt['config.get']('apache2:user:name') }}
      - require:
        - pkg:     apache2

  bundle install && gem install foreman:
    cmd:
      - user:   {{ salt['config.get']('apache2:user:name') }}
      - require:
        - pkg:     apache2

usermod -G rvm {{ salt['config.get']('apache2:user:name') }}:
  cmd.run:
    - unless:    |-
                 ( id    -Gn {{ salt['config.get']('apache2:user:name') }}     \
                 | egrep -q rvm
                 )
    - require:
      - pkg:       apache2
