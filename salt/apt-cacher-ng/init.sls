# vi: set ft=yaml.jinja :

apt-cacher-ng:
  pkg.installed:   []
  service.running:
    - enable:      True
    - watch:
      - pkg:       apt-cacher-ng

/var/cache/apt-cacher-ng:
  file.directory:
    - user:       apt-cacher-ng
    - group:      apt-cacher-ng
    - mode:      '0755'
    - require:
      - pkg:      apt-cacher-ng
