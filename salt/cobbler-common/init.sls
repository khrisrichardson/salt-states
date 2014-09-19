# vi: set ft=yaml.jinja :

cobbler-common:
  pkg.installed:
    - name:     {{ salt['config.get']('cobbler-common:pkg:name') }}

/var/lib/cobbler/config/profiles.d/salt.json:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/cobbler/config/profiles.d/salt.json
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       cobbler-common

/var/lib/cobbler/kickstarts/salt.ks:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/cobbler/kickstarts/salt.ks
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       cobbler-common

/var/lib/cobbler/snippets/salt:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/cobbler/snippets/salt
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       cobbler-common

/var/lib/cobbler/snippets/security_config:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/cobbler/snippets/security_config
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       cobbler-common

/var/lib/cobbler/snippets/storage_config:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/cobbler/snippets/storage_config
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       cobbler-common

/var/lib/cobbler/snippets/virtual_detect:
  file.managed:
    - source:      salt://{{ sls }}/var/lib/cobbler/snippets/virtual_detect
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       cobbler-common
