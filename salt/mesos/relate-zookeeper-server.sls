# vi: set ft=yaml.jinja :

{% if salt['config.get']('os_family') == 'RedHat' %}
include:
  -  zookeeper-server
{% endif %}

/etc/mesos/zk:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/mesos/zk
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       mesos
