# vi: set ft=yaml.jinja :

{% from 'bash/map.jinja' import map with context %}

bash:
  pkg.installed:
    - order:      -1
    - name:     {{ map.get('pkg', {}).get('name') }}

/etc/bash.bashrc:
  file.append:
    - name:     {{ map.get('/etc/bash.bashrc', {}).get('file', {}).get('name') }}
    - text:       "set -o vi"
    - watch:
      - pkg:       bash
