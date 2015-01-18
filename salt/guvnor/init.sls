# vi: set ft=yaml.jinja :

include:
  -  maven
  -  maven.exec
  -  openssl
  -  pwgen
  -  tomcat7
  -  whois

extend:
  /usr/share/tomcat7/bin/setenv.sh:
    file:
      - source:    salt://{{ sls }}/usr/share/tomcat7/bin/setenv.sh

  mvn:
    cmd:
      - watch:
        - pkg:     tomcat7

  tomcat7:
    service:
      - watch:
        - cmd:     mvn

/mnt/guvnor/repository.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/mnt/guvnor/repository.xml
    - user:        tomcat7
    - group:       tomcat7
    - mode:       '0755'
    - makedirs:    True
    - require:
      - pkg:       tomcat7

/var/lib/tomcat7:
  file.directory:
    - user:        tomcat7
    - group:       tomcat7
    - mode:       '0755'
    - require:
      - pkg:       tomcat7

/var/lib/tomcat7/conf/jaas.config:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/tomcat7/conf/jaas.config
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       tomcat7

/var/lib/tomcat7/webapps/ROOT/WEB-INF/beans.xml:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/tomcat7/webapps/ROOT/WEB-INF/beans.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - cmd:       mvn

/var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/log4j.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/log4j.xml
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - cmd:       mvn

#-------------------------------------------------------------------------------
# TODO: fetch binaries from repository
#-------------------------------------------------------------------------------

/var/lib/tomcat7/webapps/ROOT/WEB-INF/lib/seam-security-3.1.0.Final.jar:
  file.absent:
    - watch:
      - cmd:       mvn

/var/lib/tomcat7/webapps/ROOT/WEB-INF/lib/seam-security-3.2.0.Final.jar:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/tomcat7/webapps/ROOT/WEB-INF/lib/seam-security-3.2.0.Final.jar
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - cmd:       mvn

/var/lib/tomcat7/webapps/ROOT/WEB-INF/lib/seam-security-api-3.1.0.Final.jar:
  file.absent:
    - watch:
      - cmd:       mvn

/var/lib/tomcat7/webapps/ROOT/WEB-INF/lib/seam-security-api-3.2.0.Final.jar:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/tomcat7/webapps/ROOT/WEB-INF/lib/seam-security-api-3.2.0.Final.jar
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - cmd:       mvn
