# vi: set ft=yaml.jinja :

{% set version = '3.2.3' %}

include:
  -  debianutils
  -  tar
  -  wget
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

/usr/share/apache-maven-{{ version }}:
  cmd.run:
    - cwd:        /usr/share
    - name:      |-
                 ( wget -O - http://www.dsgnwrld.com/am/maven/maven-3/{{ version }}/binaries/apache-maven-{{ version }}-bin.tar.gz \
                 | tar  -zxvf -
                 )
    - unless:      test -d /usr/share/apache-maven-{{ version }}
    - require:
      - pkg:       tar
      - pkg:       wget

/usr/share/maven:
  file.symlink:
    - target:     /usr/share/apache-maven-{{ version }}
    - watch:
      - cmd:      /usr/share/apache-maven-{{ version }}

mvn:
  alternatives.install:
    - link:       /usr/bin/mvn
    - path:       /usr/share/maven/bin/mvn
    - priority:    150
    - watch:
      - file:     /usr/share/maven
    - watch_in:
      - file:     /usr/bin/mvn

{% elif salt['config.get']('os_family') == 'Debian' %}

maven:
  pkg.installed:
    - watch_in:
      - file:     /usr/bin/mvn

{% endif %}

/etc/profile.d/maven.sh:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/profile.d/maven.sh
    - user:        root
    - group:       root
    - mode:       '0644'

/root/.m2/settings.xml:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/root/.m2/settings.xml
    - user:        root
    - group:       root
    - mode:       '0600'
    - makedirs:    True

/usr/bin/mvn:
  file.exists:
    - require:
      - pkg:       debianutils
      - file:     /etc/profile.d/maven.sh
      - file:     /root/.m2/settings.xml
      - file:     /usr/bin/java
      - file:     /usr/bin/javac
