# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

python-openssl:
  pkg:
    name:          pyOpenSSL

{% elif salt['config.get']('os_family') == 'Debian' %}

python-openssl:
  pkg:
    name:          python-openssl

{% endif %}
