# vi: set ft=yaml.jinja :

include:
  - .depend-apache2
  - .depend-git
  -  libpq-dev
  -  libxml2-dev
  -  libxslt1-dev
  -  redis-server
  -  ruby-rvm

/opt/descartes/.env:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/opt/descartes/.env
    - user:        root
    - group:       root
    - mode:       '0644'

. /etc/profile && rvm install ruby-1.9.3-p448:
  cmd.run:
    - env:
      - PATH:     /bin:/usr/bin:/usr/local/bin:/usr/local/rvm/bin
    - unless:      test -d /usr/local/rvm/wrappers/ruby-1.9.3-p448
    - require:
      - cmd:      /usr/local/rvm

rvm use 1.9.3:
  cmd.run:
    - name:        bash --login -c "cd /opt/descartes; rvm use 1.9.3"
    - cwd:        /opt/descartes
    - env:
      - PATH:     /bin:/usr/bin:/usr/local/bin:/usr/local/rvm/bin
    - unless:    |-
                 ( bash --login -c "cd /opt/descartes
                                    rvm list                                   \
                 |                  egrep -q '^=. ruby-1.9.3-p448'"
                 )
    - require:
      - cmd:      /usr/local/rvm

#-------------------------------------------------------------------------------
# TODO: don't install foreman
# TODO: run with apache & passenger
# TODO: workaround rvm reporting inconsistently from cwd
#-------------------------------------------------------------------------------

bundle install && gem install foreman:
  cmd.run:
    - cwd:        /opt/descartes
    - unless:      bundle check
    - require:
      - cmd:       rvm use 1.9.3
