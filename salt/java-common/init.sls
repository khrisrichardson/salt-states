# vi: set ft=yaml.jinja :

{% set codename = salt['config.get']('oscodename') %}

{% if salt['config.get']('os_family') == 'Debian' %}

accepted-oracle-license-v1-1-select:
  cmd.run:
    - name:      |-
                 ( ( echo -n "debconf shared/accepted-oracle-license-v1-1"
                     echo    " select true"
                   )                                                           \
                 | debconf-set-selections
                 )
    - unless:    |-
                 ( debconf-get-selections                                      \
                 | egrep "debconf\s+shared/accepted-oracle-license-v1-1.*true"
                 )

accepted-oracle-license-v1-1-seen:
  cmd.wait:
    - name:      |-
                 ( ( echo -n "debconf shared/accepted-oracle-license-v1-1"
                     echo      " seen true"
                   )                                                           \
                 | debconf-set-selections
                 )
    - watch:
      - cmd:       accepted-oracle-license-v1-1-select

webupd8team-java:
  pkgrepo.managed:
    - name:        deb http://ppa.launchpad.net/webupd8team/java/ubuntu {{ codename }} main
    - file:       /etc/apt/sources.list.d/webupd8team-java.list
    - keyid:       EEA14886
    - keyserver:   hkp://keyserver.ubuntu.com:80
    - require:
      - pkg:       python-apt

java-common:
  pkg.installed:   []

{% endif %}

/usr/bin/java:
  file.exists:     []

/usr/bin/javac:
  file.exists:     []
