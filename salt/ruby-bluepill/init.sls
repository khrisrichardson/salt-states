# vi: set ft=yaml.jinja :

gem install bluepill:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list bluepill                                           \
                 | egrep -q bluepill
                 )
