# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

oracle-java8-installer:
  pkg:
    name:          jdk

{% elif salt['config.get']('os_family') == 'Debian' %}

oracle-java8-installer:
  pkg:
    name:          oracle-java8-installer

{% endif %}
