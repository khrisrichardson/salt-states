# vi: set ft=yaml.jinja :

{% set devs     =  salt['cmd.run']('ls -1d /dev/{s,{u,x,}v}d{b..z} 2>/dev/null').split('\n') %}
{% set codename =  salt['config.get']('lsb_distrib_codename') %}
{% set codename = 'precise' %}
{% set version  = 'cdh4' %}
{% set roles    = [] %}
{% do  roles.append('cloudera-cm4-server') %}
{% do  roles.append('cloudera-cm5-server') %}
{% set minions = salt['roles.dict'](roles) %}

include:
  {% if   minions['cloudera-cm4-server'] %}
  -  cloudera-cm4-agent
  {% elif minions['cloudera-cm5-server'] %}
  -  cloudera-cm5-agent
  {% else %}
  -  hadoop-hdfs
  -  sudo
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}
  {% endif %}

{% if minions['cloudera-cm4-server']
   or minions['cloudera-cm5-server'] %}

hadoop-hdfs-namenode:
  pkg.removed:
    - require:
      - service:   hadoop-hdfs-namenode
    - require_in:
      - cloudera_parcel:     CDH
  service.dead:
    - enable:      False

{% else %}

hadoop-hdfs-namenode:
  pkg.installed:
   {% if salt['config.get']('os') == 'Ubuntu' %}
    - fromrepo: {{ codename }}-{{ version }}
   {% endif %}
    - require:
      - pkgrepo:   cloudera-{{ version }}
  service.running:
    - enable:      True
    - watch:
      - pkg:       hadoop-hdfs-namenode
      - file:     /usr/bin/java

sudo -u hdfs hdfs namenode -format:
  cmd.run:
    - unless:    |-
                 ( test -d                                                     \
                 $( sudo -u hdfs hdfs getconf -confKey dfs.namenode.name.dir   \
                  |  cut -d, -f1
                  )/current
                 )
    - require:
      - pkg:       hadoop-hdfs-namenode
      - pkg:       sudo
    - require_in:
      - service:   hadoop-hdfs-namenode

sudo -u hdfs hadoop fs -mkdir /tmp:
  cmd.run:
    - unless:      sudo -u hdfs hadoop fs -ls -d /tmp
    - require:
      - pkg:       sudo
      - service:   hadoop-hdfs-namenode

sudo -u hdfs hadoop fs -chmod -R 1777 /tmp:
  cmd.run:
    - unless:    |-
                 ( sudo -u hdfs hadoop fs -ls -d /tmp                          \
                 | grep drwxrwxrwt
                 )
    - require:
      - cmd:       sudo -u hdfs hadoop fs -mkdir /tmp

{% endif %}

{% if  devs|length > 1 %}
{% for dev in devs %}
{% if  dev %}

/data/{{ loop.index }}/dfs/nn:
  file.directory:
    - user:        hdfs
    - group:       hdfs
    - mode:       '0700'
    - require:
      - file:     /data/{{ loop.index }}/dfs
     {% if minions['cloudera-cm4-server']
        or minions['cloudera-cm5-server'] %}
      - cloudera_parcel:     CDH
     {% else %}
      - pkg:       hadoop-hdfs-namenode
    - require_in:
      - service:   hadoop-hdfs-namenode
     {% endif %}

{% endif %}
{% endfor %}
{% else %}

/var/lib/hadoop-hdfs/cache/hdfs/dfs/nn:
  file.directory:
    - user:        hdfs
    - group:       hadoop
    - mode:       '0755'
    - require:
      - file:     /var/lib/hadoop-hdfs/cache/hdfs/dfs
    - require_in:
      - service:   hadoop-hdfs-namenode

{% endif %}
