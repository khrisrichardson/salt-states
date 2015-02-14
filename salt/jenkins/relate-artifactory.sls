# vi: set ft=yaml.jinja :

{% set plugins = ['artifactory'] %}

include:
  -  jenkins

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
