# vi: set ft=yaml.jinja :

{% set fun_args = data.fun_args[0] %}
{% if 'pillar'      in fun_args %}
{% set pillar       =  fun_args['pillar'] %}
{% if 'orchestrate' in pillar %}
{% set orchestrate  =  pillar['orchestrate'] %}
{% else %}
{% set orchestrate  =  False %}
{% endif %}
{% else %}
{% set orchestrate  =  False %}
{% endif %}
{% if 'saltenv'     in fun_args %}
{% set saltenv      =  fun_args['saltenv'] %}
{% else %}
{% set saltenv      = 'base' %}
{% endif %}
{% if            data.fun     == 'state.highstate'
   and           data.retcode ==  0
   and not       orchestrate %}
{% for return in data.return.values() %}
{% if  return.changes|length   >  0
   and return.name            != 'mine.update' %}

state_sls_orchestrate:
  cmd.state.sls:
    - tgt:        'G@environment:{{ saltenv }} and not {{ data.id }}'
    - expr_form:   compound
    - arg:
      - orchestrate
    - kwarg:
        queue:     True
        pillar:
          related: {'minion': '{{ data.id }}'}
        saltenv:  {{ saltenv }}

{% break %}
{% endif %}
{% endfor %}
{% endif %}
