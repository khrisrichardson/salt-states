# vi: set ft=yaml.jinja :

include:
  -  cloudera-cm5
  -  cloudera-cm5-api
  -  hadoop-hdfs.depend-e2fsprogs
  -  hadoop-hdfs.depend-mount
  -  hadoop-hdfs.depend-parted
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}

cloudera-cm5-agent:
  pkg.installed:
    - name:        cloudera-manager-agent
    - require:
      - pkgrepo:   cloudera-cm5
  service.running:
    - name:        cloudera-scm-agent
    - enable:      True
    - watch:
      - pkg:       cloudera-cm5-agent
      - file:     /usr/bin/java

/etc/cloudera-scm-agent/config.ini:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/cloudera-scm-agent/config.ini
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - host:      127.0.0.1
      - host:      127.0.1.1
    - watch:
      - pkg:       cloudera-cm5-agent
    - watch_in:
      - service:   cloudera-cm5-agent
