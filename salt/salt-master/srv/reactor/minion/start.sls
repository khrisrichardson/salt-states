# vi: set ft=yaml.jinja :

state_highstate_orchestrate:
  cmd.state.highstate:
    - tgt:      {{ data.id }}
    - kwarg:
        pillar:  {'orchestrate': 'True'}
