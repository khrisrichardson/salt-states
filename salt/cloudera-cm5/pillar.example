# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

cloudera-cm5:
  pkgrepo:
    name:          cloudera-cm5
    file:         /etc/yum.repos.d/cloudera-cm5.repo
    key_url:       http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera

{% elif salt['config.get']('os_family') == 'Debian' %}

cloudera-cm5:
  pkgrepo:
    name:          deb [arch=amd64] http://archive.cloudera.com/cm5/ubuntu/{{ codename }}/amd64/cm {{ codename }}-cm5
    file:         /etc/apt/sources.list.d/cloudera-cm5.list
    key_url:       http://archive.cloudera.com/cdh5/ubuntu/{{ codename }}/amd64/cdh/archive.key

{% endif %}
