# vi: set ft=yaml.jinja :

include:
  -  curl
  -  default-jre
  -  python-protobuf
  -  python-setuptools
  -  zookeeperd

mesos:
  pkg.installed:
    - sources:
     {% if   salt['config.get']('os_family') == 'RedHat' %}
      - mesos: http://downloads.mesosphere.io/master/centos/6/mesos_0.19.0_x86_64.rpm
     {% elif salt['config.get']('os_family') == 'Debian' %}
      - mesos: http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.19.0~ubuntu14.04%2B1_amd64.deb
     {% endif %}
    - require:
      - pkg:       curl
      - pkg:       default-jre
      - pkg:       python-protobuf
      - pkg:       python-setuptools
      - pkg:       zookeeperd
  cmd.wait:
    - name:        easy_install http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.19.0_rc2-py2.7-linux-x86_64.egg
    - unless:      python -c 'import mesos'
    - watch:
      - pkg:       mesos
