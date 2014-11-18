# vi: set ft=yaml.jinja :

{% from  'bash/map.jinja'
   import bash
   with   context %}

bash:
  pkg.installed:
    - order:      -1
    - name:     {{ bash['pkg']['name'] }}

/etc/bash.bashrc:
  file.append:
    - name:     {{ bash['/etc/bash.bashrc']['file']['name'] }}
    - text:       "set -o vi"
    - watch:
      - pkg:       bash
