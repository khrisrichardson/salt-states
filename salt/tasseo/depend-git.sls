# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}
{% set minions     = salt['mine.get']('environment:' + environment, 'grains.item', expr_form='grain') %}

include:
  -  git
  -  tasseo

extend:
{% for minion in minions %}
  /opt/tasseo/dashboards/{{ minion }}.js:
    file:
      - require:
        - git:     https://github.com/obfuscurity/tasseo.git
{% endfor %}

  /opt/tasseo/lib/tasseo/public/c/style.css:
    file:
      - require:
        - git:     https://github.com/obfuscurity/tasseo.git

  rvm use 1.9.2:
    cmd:
      - require:
        - git:     https://github.com/obfuscurity/tasseo.git

  bundle install && gem install foreman:
    cmd:
      - require:
        - git:     https://github.com/obfuscurity/tasseo.git

https://github.com/obfuscurity/tasseo.git:
  git.latest:
    - rev:         master
    - user:        root
    - force:       True
    - target:     /opt/tasseo
    - require:
      - pkg:       git
