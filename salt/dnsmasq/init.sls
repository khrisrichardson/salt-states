# vi: set ft=yaml.jinja :

dnsmasq:
  pkg.installed:   []
  service.running:
    - enable:      True
    - watch:
      - pkg:       dnsmasq
