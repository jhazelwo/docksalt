pathfile:
  file.managed:
    - name: /tmp/path
    - contents: {{ salt['environ.get']('PATH') }}

ninjaf:
  file.managed:
    - name: /tmp/ninja.sh
    - contents: echo "{{ pillar['ninja']['is'] }}"
    - mode: '0670'
    - user: 1
    - group: 0

piratef:
  file.managed:
    - name: /tmp/pirate.txt
    - contents: is {{ pillar['pirate'] }}
    - mode: '0444'
    - user: nobody
    - group: nobody

