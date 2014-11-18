# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

python-protobuf:
  pkg:
    name:          protobuf-python

{% elif salt['config.get']('os_family') == 'Debian' %}

python-protobuf:
  pkg:
    name:          python-protobuf

{% endif %}
