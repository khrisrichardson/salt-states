# vi: set ft=yaml.jinja :

include:
  -  libpq-dev

gem install pg:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list pg                                                 \
                 | egrep -q pg
                 )
