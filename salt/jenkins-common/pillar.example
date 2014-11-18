# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

jenkins-common:
  pkgrepo:
    name:          jenkins
    file:         /etc/yum.repos.d/jenkins.repo
    key_url:       http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

{% elif salt['config.get']('os_family') == 'Debian' %}

jenkins-common:
  pkgrepo:
    name:          deb http://pkg.jenkins-ci.org/debian binary/
    file:         /etc/apt/sources.list.d/jenkins.list
    key_url:       http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key

{% endif %}
