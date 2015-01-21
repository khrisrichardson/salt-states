# vi: set ft=yaml.jinja :

gem install bunny:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list bunny                                              \
                 | egrep -q bunny
                 )
