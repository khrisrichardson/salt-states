# vi: set ft=yaml.jinja :

{% from 'jenkins/map.jinja' import map with context %}

{% set plugins = [] %}

include:
  -  git
  -  jenkins-common
  -  maven
  -  openssh-client.known_hosts.github.com
  -  wget
  {% if   salt['config.get']('os_family') == 'RedHat' %}
  -  oracle-j2sdk1_7
  {% elif salt['config.get']('os_family') == 'Debian' %}
  -  oracle-java7-installer
  {% endif %}

extend:
  github.com:
    ssh_known_hosts:
      - user:      jenkins
      - require:
        - pkg:     jenkins

jenkins:
  pkg.installed:   []
  service.running:
    - enable:      True
    - watch:
      - pkg:       jenkins
      - file:     /usr/bin/java

/var/lib/jenkins/.ssh:
  file.directory:
    - user:        jenkins
    - group:       jenkins
    - mode:       '0700'
    - require:
      - pkg:       jenkins

/var/lib/jenkins/.ssh/id_rsa:
  file.managed:
    - contents_pillar:  openssh-client:id_rsa
    - user:        jenkins
    - group:       jenkins
    - mode:       '0400'
    - require:
      - file:     /var/lib/jenkins/.ssh

/var/lib/jenkins/jobs:
  file.directory:
    - user:        jenkins
    - group:    {{ map.get('group', {}).get('name') }}
    - mode:       '0755'
    - require:
      - pkg:       jenkins

/var/lib/jenkins/plugins:
  file.directory:
    - user:        jenkins
    - group:    {{ map.get('group', {}).get('name') }}
    - mode:       '0755'
    - require:
      - pkg:       jenkins

{% do  plugins.append('analysis-core') %}
{% do  plugins.append('android-emulator') %}
{% do  plugins.append('android-lint') %}
{% do  plugins.append('config-file-provider') %}
{% do  plugins.append('dashboard-view') %}
{% do  plugins.append('email-ext') %}
{% do  plugins.append('emma') %}
{% do  plugins.append('findbugs') %}
{% do  plugins.append('git') %}
{% do  plugins.append('git-client') %}
{% do  plugins.append('git-parameter') %}
{% do  plugins.append('gitlab-hook') %}
{% do  plugins.append('gitlab-merge-request-jenkins') %}
{% do  plugins.append('ldap') %}
{% do  plugins.append('m2release') %}
{% do  plugins.append('port-allocator') %}
{% do  plugins.append('ruby-runtime') %}
{% do  plugins.append('scm-api') %}
{% do  plugins.append('token-macro') %}
{% for plugin in plugins %}

wget --no-check-certificate --timestamping https://updates.jenkins-ci.org/latest/{{ plugin }}.hpi:
  cmd.run:
    - cwd:        /var/lib/jenkins/plugins
    - user:        jenkins
    - unless:      test -d /var/lib/jenkins/plugins/{{ plugin }}
    - require:
      - pkg:       wget
      - file:     /var/lib/jenkins/plugins
    - watch_in:
      - service:   jenkins

{% endfor %}

{% set plugins = [] %}
{% do  plugins.append('cvs') %}
{% do  plugins.append('subversion') %}
{% for plugin in plugins %}

/var/lib/jenkins/plugins/{{ plugin }}:
  file.absent:
    - watch_in:
      - service:   jenkins

/var/lib/jenkins/plugins/{{ plugin }}.hpi:
  file.absent:
    - watch_in:
      - service:   jenkins

/var/lib/jenkins/plugins/{{ plugin }}.jpi:
  file.absent:
    - watch_in:
      - service:   jenkins

{% endfor %}
