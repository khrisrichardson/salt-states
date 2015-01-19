# vi: set ft=yaml.jinja :

{% set environment = salt['grains.get']('environment') %}
{% set minions     = salt['mine.get']('environment:' + environment, 'grains.item', expr_form='grain') %}

include:
  - .depend-apache2
  - .depend-git
  -  ruby-rvm

{% for minion in minions %}

/opt/tasseo/dashboards/{{ minion }}.js:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/opt/tasseo/dashboards/node.js
    - mode:       '0644'
    - context:
        minion: {{ minion }}

{% endfor %}

/opt/tasseo/lib/tasseo/public/c/style.css:
  file.managed:
    - source:      salt://{{ sls }}/opt/tasseo/lib/tasseo/public/c/style.css
    - mode:       '0644'

. /etc/profile && rvm install ruby-1.9.2-p320:
  cmd.run:
    - env:
      - PATH:     /bin:/usr/bin:/usr/local/bin:/usr/local/rvm/bin
    - unless:      test -d /usr/local/rvm/wrappers/ruby-1.9.2-p320
    - require:
      - cmd:       curl https://get.rvm.io

rvm use 1.9.2:
  cmd.run:
    - name:        bash --login -c "cd /opt/tasseo; rvm use 1.9.2"
    - env:
      - PATH:     /bin:/usr/bin:/usr/local/bin:/usr/local/rvm/bin
    - cwd:        /opt/tasseo
    - unless:    |-
                 ( rvm list                                                    \
                 | egrep -q '^=. ruby-1.9.2-p320'
                 )
    - require:
      - cmd:       curl https://get.rvm.io

#-------------------------------------------------------------------------------
# TODO: don't install foreman
# TODO: run with apache & passenger
# TODO: workaround rvm reporting inconsistently from cwd
#-------------------------------------------------------------------------------

bundle install && gem install foreman:
  cmd.run:
    - cwd:        /opt/tasseo
    - unless:      bundle check
    - require:
      - cmd:       rvm use 1.9.2
