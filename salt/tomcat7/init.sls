# vi: set ft=yaml.jinja :

include:
  - .depend-maven
  -  liblog4j1-2-java
  -  libtcnative-1

tomcat7:
  pkg.installed:   []
  service.running:
    - enable:      True
    - sig:        'org.apache.catalina.startup.Bootstrap start'
    - watch:
      - pkg:       tomcat7

/usr/share/tomcat7/bin/setenv.sh:
  file.managed:
    - template:    jinja
    - user:        root
    - group:       root
    - mode:       '0755'
    - watch:
      - pkg:       tomcat7
    - watch_in:
      - service:   tomcat7

/var/lib/tomcat7/conf/context.xml:
  file.managed:
    - template:    jinja
    - user:        root
    - group:       tomcat7
    - mode:       '0644'
    - watch:
      - pkg:       tomcat7
    - watch_in:
      - service:   tomcat7

/var/lib/tomcat7/conf/server.xml:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/tomcat7/conf/server.xml
    - user:        root
    - group:       tomcat7
    - mode:       '0644'
    - watch:
      - pkg:       tomcat7
    - watch_in:
      - service:   tomcat7

/var/log/tomcat7:
  file.directory:
    - user:        tomcat7
    - group:       adm
    - mode:       '0755'
    - watch:
      - pkg:       tomcat7

/var/lib/tomcat7/webapps/ROOT/index.html:
  file.absent:
    - watch:
      - pkg:       tomcat7
    - watch_in:
      - service:   tomcat7
