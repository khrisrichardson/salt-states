# vi: set ft=yaml.jinja :

gem install mysql:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list mysql                                              \
                 | egrep -q mysql
                 )
