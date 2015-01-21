# vi: set ft=yaml.jinja :

gem install snmp:
  cmd.run:
    - onlyif:      which gem
    - unless:    |-
                 ( gem list snmp                                               \
                 | egrep -q snmp
                 )
