# vi: set ft=yaml.jinja :

include:
  -  oracle-java6-installer

{% if   salt['config.get']('os_family') == 'RedHat' %}

{% set java   = salt['cmd.run']('ls -1d /usr/java/jdk1.6.?_??/jre/bin/java   2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  java %}

java1.6:
  alternatives.install:
    - link:       /usr/bin/java1.6
    - path:     {{ java }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java6-installer

{% endif %}
{% set javac  = salt['cmd.run']('ls -1d /usr/java/jdk1.6.?_??/bin/javac      2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  javac %}

javac1.6:
  alternatives.install:
    - link:       /usr/bin/javac1.6
    - path:     {{ javac }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java6-installer

{% endif %}
{% set javaws = salt['cmd.run']('ls -1d /usr/java/jdk1.6.?_??/jre/bin/javaws 2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  javaws %}

javaws1.6:
  alternatives.install:
    - link:       /usr/bin/javaws1.6
    - path:     {{ javaws }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java6-installer

{% endif %}

{% elif salt['config.get']('os_family') == 'Debian' %}

oracle-java6-set-default:
  pkg.installed:
    - watch:
      - pkg:       oracle-java6-installer

/usr/bin/java1.6:
  file.symlink:
    - target:     /usr/lib/jvm/java-6-oracle/jre/bin/java
    - require:
      - pkg:       oracle-java6-set-default

/usr/bin/javac1.6:
  file.symlink:
    - target:     /usr/lib/jvm/java-6-oracle/bin/javac
    - require:
      - pkg:       oracle-java6-set-default

/usr/bin/javaws1.6:
  file.symlink:
    - target:     /usr/lib/jvm/java-6-oracle/jre/bin/javaws
    - require:
      - pkg:       oracle-java6-set-default

{% endif %}
