# vi: set ft=yaml.jinja :

{% set roles = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  - .depend-maven
  {% if   minions['cloudera-cm4-server'] %}
  -  cloudera-cm4-agent
  {% elif minions['cloudera-cm5-server'] %}
  -  cloudera-cm5-agent
  {% else %}
  -  tomcat7
  {% endif %}

{% if minions['cloudera-cm4-server']
   or minions['cloudera-cm5-server'] %}

tomcat7:
  pkg.removed:
    - require:
      - service:   tomcat7
    - require_in:
      - cloudera_parcel:     SOLR
  service.dead:
    - enable:      False

{% else %}

extend:
  /usr/share/tomcat7/bin/setenv.sh:
    file:
      - source:    salt://{{ sls }}/usr/share/tomcat7/bin/setenv.sh

{% endif %}
