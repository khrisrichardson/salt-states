# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

openjdk-7-jre-headless:
  pkg:
    name:          java-1.7.0-openjdk

{% elif salt['config.get']('os_family') == 'Debian' %}

openjdk-7-jre-headless:
  pkg:
    name:          openjdk-7-jre-headless

{% endif %}
