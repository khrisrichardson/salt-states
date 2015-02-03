# vi: set ft=yaml.jinja :

gem install beaneater:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list beaneater                                          \
                 | egrep -q beaneater
                 )
