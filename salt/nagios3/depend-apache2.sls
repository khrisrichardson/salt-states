# vi: set ft=yaml.jinja :

{% from  'apache2/map.jinja'
   import apache2
   with   context %}

{% set psls = sls.split('.')[0] %}

include:
  -  apache2
  -  nagios3.depend-libapache2-mod-php5

/etc/apache2/sites-available/{{ psls }}:
  file.managed:
    - template:    jinja
    - name:     {{ apache2['/etc/apache2/sites-available']['file']['name'] }}/{{ psls }}{{ apache2['conf']['extension'] }}
    - source:      salt://{{ psls }}/etc/apache2/sites-available/{{ psls }}
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - pkg:       apache2
    - watch_in:
      - service:   apache2

/etc/apache2/sites-enabled/{{ psls }}:
  file.symlink:
    - target:     /etc/apache2/sites-available/{{ psls }}
    - onlyif:      test -d /etc/apache2/sites-enabled
    - require:
      - file:     /etc/apache2/sites-available/{{ psls }}
