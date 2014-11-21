# vi: set ft=yaml.jinja :

beanstalkd:
  pkg.installed:   []
  service.running:
    - enable:      True
    - watch:
      - pkg:       beanstalkd
