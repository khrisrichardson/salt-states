# vi: set ft=yaml.jinja :

{% set name = salt['config.get']('java-common:pkg:name') %}
{% if  name %}
{% if 'installer' in name %}

include:
  - {{ name|replace('installer', 'set-default') }}

{% else %}

java:
  alternatives.install:
    - link:       /usr/bin/java
    - path:     {% for file in salt['pkg.file_list'](name)['files']|sort %}{% if 'jre/bin/java' in file %}{{ file }}{% break %}{% endif %}{% endfor %}
    - priority:    20000

javac:
  alternatives.install:
    - link:       /usr/bin/javac
    - path:     {% for file in salt['pkg.file_list'](name)['files']|sort %}{% if 'bin/javac'    in file %}{{ file }}{% break %}{% endif %}{% endfor %}
    - priority:    20000

{% endif %}
{% endif %}
