# vi: set ft=yaml.jinja :

include:
  -  oracle-java8-installer

{% if   salt['config.get']('os_family') == 'RedHat' %}

{% set java   = salt['cmd.run']('ls -1d /usr/java/jdk1.8.?_??/jre/bin/java   2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  java %}

java1.8:
  alternatives.install:
    - link:       /usr/bin/java1.8
    - path:     {{ java }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java8-installer

{% endif %}
{% set javac  = salt['cmd.run']('ls -1d /usr/java/jdk1.8.?_??/bin/javac      2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  javac %}

javac1.8:
  alternatives.install:
    - link:       /usr/bin/javac1.8
    - path:     {{ javac }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java8-installer

{% endif %}
{% set javaws = salt['cmd.run']('ls -1d /usr/java/jdk1.8.?_??/jre/bin/javaws 2>/dev/null'
                           + ' | tail -1'
                               ) %}
{% if  javaws %}

javaws1.8:
  alternatives.install:
    - link:       /usr/bin/javaws1.8
    - path:     {{ javaws }}
    - priority:    20000
    - watch:
      - pkg:       oracle-java8-installer

{% endif %}

{% elif salt['config.get']('os_family') == 'Debian' %}

oracle-java8-set-default:
  pkg.installed:
    - watch:
      - pkg:       oracle-java8-installer

/usr/bin/java1.8:
  file.symlink:
    - target:     /usr/lib/jvm/java-8-oracle/jre/bin/java
    - require:
      - pkg:       oracle-java8-set-default

/usr/bin/javac1.8:
  file.symlink:
    - target:     /usr/lib/jvm/java-8-oracle/bin/javac
    - require:
      - pkg:       oracle-java8-set-default

/usr/bin/javaws1.8:
  file.symlink:
    - target:     /usr/lib/jvm/java-8-oracle/jre/bin/javaws
    - require:
      - pkg:       oracle-java8-set-default

{% endif %}
