# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

/etc/collectd/collectd.conf:
  file:
    name:         /etc/collectd.conf

{% elif salt['config.get']('os_family') == 'Debian' %}

/etc/collectd/collectd.conf:
  file:
    name:         /etc/collectd/collectd.conf

{% endif %}
