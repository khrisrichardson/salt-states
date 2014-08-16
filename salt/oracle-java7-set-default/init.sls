# vi: set ft=yaml.jinja :

include:
  -  oracle-java7-installer

{% if   salt['config.get']('os_family') == 'RedHat' %}

{% set java   = salt['cmd.run']('ls -1d /usr/java/jdk1.7.?_??/jre/bin/java   2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  java %}

java1.7:
  alternatives.install:
    - link:       /usr/bin/java1.7
    - path:     {{ java }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java7-installer

{% endif %}
{% set javac  = salt['cmd.run']('ls -1d /usr/java/jdk1.7.?_??/bin/javac      2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  javac %}

javac1.7:
  alternatives.install:
    - link:       /usr/bin/javac1.7
    - path:     {{ javac }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java7-installer

{% endif %}
{% set javaws = salt['cmd.run']('ls -1d /usr/java/jdk1.7.?_??/jre/bin/javaws 2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  javaws %}

javaws1.7:
  alternatives.install:
    - link:       /usr/bin/javaws1.7
    - path:     {{ javaws }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java7-installer

{% endif %}

{% elif salt['config.get']('os_family') == 'Debian' %}

oracle-java7-set-default:
  pkg.installed:
    - watch:
      - pkg:       oracle-java7-installer

/usr/bin/java1.7:
  file.symlink:
    - target:     /usr/lib/jvm/java-7-oracle/jre/bin/java
    - require:
      - pkg:       oracle-java7-set-default

/usr/bin/javac1.7:
  file.symlink:
    - target:     /usr/lib/jvm/java-7-oracle/bin/javac
    - require:
      - pkg:       oracle-java7-set-default

/usr/bin/javaws1.7:
  file.symlink:
    - target:     /usr/lib/jvm/java-7-oracle/jre/bin/javaws
    - require:
      - pkg:       oracle-java7-set-default

{% endif %}
