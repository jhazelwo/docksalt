arbitf:
  file.managed:
    - name: /tmp/arbit.txt
    - contents: Env var 'foo' set to "{{ salt['environ.get']('foo') }}"

