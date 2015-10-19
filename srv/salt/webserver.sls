httpd:
  pkg:
    - installed

/tmp/file.txt:
   file:
    - managed
    - source: salt://index.html  

apache:
  user.present:
    - uid: 8080
    - gid: 8080
    - home: /var/www/html
    - shell: /bin/nologin
    - require:
      - group: apache
  group.present:
    - gid: 8080

