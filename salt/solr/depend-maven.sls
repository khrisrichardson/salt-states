# vi: set ft=yaml.jinja :

{% set psls  = sls.split('.')[0] %}
{% set roles = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% set minions = salt['roles.dict'](roles) %}

{% if  not minions['cloudera-cm4-server']
   and not minions['cloudera-cm5-server'] %}

include:
  -  maven
  -  maven.exec
  -  solr

{% if  salt['config.get']('maven3:coordinates')
   and salt['config.get']('maven3:coordinates').split(':')[2][0] != '4' %}

extend:
  tomcat7:
    service:
      - watch:
        - cmd:     mvn

  /root/pom.xml:
    file:
      - source:    salt://{{ psls }}/root/pom.xml

{% endif %}
{% endif %}
