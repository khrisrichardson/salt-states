# vi: set ft=yaml.jinja :

zookeeperd:
  pkg.installed:   []
  service.running:
    - name:        zookeeper
    - enable:      True
    - watch:
      - pkg:       zookeeperd
