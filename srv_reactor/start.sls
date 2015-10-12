{% if data['id'] == 'minion' %}
highstate_run:
  local.cmd.run:
    - arg: 
      - date > /tmp/salt.started.at
    - tgt: minion
{% endif %}

