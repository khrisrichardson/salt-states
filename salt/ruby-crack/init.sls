# vi: set ft=yaml.jinja :

gem install crack:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list crack                                              \
                 | egrep -q crack
                 )
