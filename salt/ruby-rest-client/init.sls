# vi: set ft=yaml.jinja :

gem install rest-client:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list rest-client                                        \
                 | egrep -q rest-client
                 )
