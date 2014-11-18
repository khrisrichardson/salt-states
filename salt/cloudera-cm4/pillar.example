# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

cloudera-cm4:
  pkgrepo:
    name:          cloudera-cm4
    file:         /etc/yum.repos.d/cloudera-cm4.repo
    key_url:       http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera

{% elif salt['config.get']('os_family') == 'Debian' %}

cloudera-cm4:
  pkgrepo:
    name:          deb [arch=amd64] http://archive.cloudera.com/cm4/ubuntu/{{ codename }}/amd64/cm {{ codename }}-cm4
    file:         /etc/apt/sources.list.d/cloudera-cm4.list
    key_url:       http://archive.cloudera.com/cdh4/ubuntu/{{ codename }}/amd64/cdh/archive.key

{% endif %}
