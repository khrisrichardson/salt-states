# vi: set ft=yaml.jinja :

include:
  - .depend-supervisor
  -  kafka

/usr/share/kafka/config/consumer.properties:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/usr/share/kafka/config/consumer.properties
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/share/kafka/config
