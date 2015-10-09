pathfile:
  file.managed:
    - name: /tmp/path
    - contents: {{ salt['environ.get']('PATH') }}

ninjaf:
  file.managed:
    - name: /tmp/ninja.sh
    - contents: echo "{{ pillar['ninja']['is'] }}"
    - mode: '0670'
    - owner: 1
    - group: 0

