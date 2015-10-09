httpd:
  pkg:
    - installed

/tmp/file.txt:
   file:
    - managed
    - source: salt://index.html  

