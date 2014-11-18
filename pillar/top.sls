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
