# vi: set ft=yaml.jinja :

{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}

{% if   salt['config.get']('os_family') == 'RedHat' %}

cloudera-cdh5:
  pkgrepo:
    name:          cloudera-cdh5
    file:         /etc/yum.repos.d/cloudera-cdh5.repo
    key_url:       http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera

{% elif salt['config.get']('os_family') == 'Debian' %}

cloudera-cdh5:
  pkgrepo:
    name:          deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/{{ codename }}/amd64/cdh {{ codename }}-cdh5
    file:         /etc/apt/sources.list.d/cloudera-cdh5.list
    key_url:       http://archive.cloudera.com/cdh5/ubuntu/{{ codename }}/amd64/cdh/archive.key

{% endif %}
