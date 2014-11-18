# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

snmpd:
  pkg:
    name:          net-snmp-libs

{% elif salt['config.get']('os_family') == 'Debian' %}

snmpd:
  pkg:
    name:          snmpd

{% endif %}
