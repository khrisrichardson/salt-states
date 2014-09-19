# vi: set ft=yaml.jinja :

{# set repository  = 'https://github.com/khrisrichardson/salt-states.git' #}
{# set refs        =  salt['cmd.run']('git ls-remote --heads ' + repository
                                 + ' | rev'
                                 + ' | cut -d/ -f1'
                                 + ' | rev'
                                     ).split('\n') #}
{# if                 salt['grains.get']('environment') in refs #}
{% if                 salt['grains.get']('environment') %}
{% set environment =  salt['grains.get']('environment') %}
{% else %}
{% set environment = 'base' %}
{% endif %}

{{ environment }}:
  '*':
    - apache2
    - base-files
    - bash
    - calamari
    - ceph-common
    - cloudera-cdh4
    - cloudera-cdh5
    - cloudera-cm4
    - cloudera-cm5
    - cloudera-cm4-api
    - cloudera-cm5-api
    - cobbler
    - cobbler-common
    - collectd
    - cron
    - datastax
    - debianutils
    - dnsutils
    - elasticsearch
    - ganglia-monitor
    - gmetad
    - golang-go
    - graphite-carbon
    - graphite-web
    - gunicorn
    - incron
    - jenkins-common
    - libgit2-dev
    - libpq-dev
    - libvirt-bin
    - libxml2-dev
    - libxslt1-dev
    - libzmq3-dev
    - logstash
    - lxc-docker
    - mariadb-server
    - mongodb-server
    - multipath-tools
    - mysql-common
    - mysql-server
    - nagios3
    - nagios-nrpe-server
    - nagios-plugins-basic
    - netbase
    - netcat
    - newrelic
    - nfs-kernel-server
    - nginx
    - nginx-common
    - nis
    - npm
    - ntp
    - openjdk-7-jre-headless
    - openssh-client
    - openssh-server
    - openstack-common
    - opsview-base
    - oracle-j2sdk1_6
    - oracle-j2sdk1_7
    - oracle-j2sdk1_8
    - oracle-java6-installer
    - oracle-java7-installer
    - oracle-java8-installer
    - php5
    - php5-cli
    - php5-curl
    - php5-fpm
    - php5-json
    - php5-mbstring
    - php5-mcrypt
    - php5-pdo
    - postfix
    - postgresql
    - procps
    - python-dev
    - python-openssl
    - python-protobuf
    - python-repoze_lru
    - qpidd
    - radosgw
    - redis-server
    - salt-common
    - salt-minion
    - salt-ssh
    - sensu
    - snmpd
    - supervisor
    - uuid-runtime
    - vim
