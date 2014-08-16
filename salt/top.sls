# vi: set ft=yaml.jinja :

{# set repository  = 'https://github.com/khrisrichardson/salt-states.git' #}
{# set refs        =  salt['cmd.run']('git ls-remote --heads ' + repository
                                 + ' | rev'
                                 + ' | cut -d/ -f1'
                                 + ' | rev'
                                     ).split('\n') #}
{# if                 salt['grains.get']('environment') in refs #}
{% if                 salt['grains.get']('environment') %}
{% set environment =  salt['grains.get']('environment') %}
{% else %}
{% set environment = 'base' %}
{% endif %}
{% set roles       =  salt['config.get']('roles', []) %}

{{ environment }}:
  '*':
    - salt-minion
   {% if      salt['config.get']('orchestrate')|lower == 'true'
      or     salt['environ.get']('orchestrate')|lower == 'true'
      or      salt['config.get']('subordinate')|lower == 'true'
      or     salt['environ.get']('subordinate')|lower == 'true' %}
    - collectd
   {% if      salt['config.get']('virtual') == 'kvm'
      or      salt['config.get']('virtual') == 'VMware'
      or     (salt['config.get']('virtual') == 'physical'
      and not salt['config.get']('virtual_subtype')) %}
    - bash
    - ntp
    - openssh-server
    - vim
   {% endif %}
   {% endif %}
   {% if      salt['config.get']('orchestrate')|lower == 'true'
      or     salt['environ.get']('orchestrate')|lower == 'true' %}
    - orchestrate
   {% endif %}

{% for role in roles %}

{% if environment %}
  'G@roles:{{ role }} and G@environment:{{ environment }}':
{% else %}
  'G@roles:{{ role }}':
{% endif %}
    - match: compound
    - {{ role }}

{% endfor %}
