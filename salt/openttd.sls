include:
  - tom

openttd:
  archive.extracted:
    - name: /opt/openttd/
    - source: https://binaries.openttd.org/releases/1.5.3/openttd-1.5.3-linux-generic-amd64.tar.gz
    - source_hash: md5=2498191548c0d9e99e6640a469725359
    - archive_format: tar
    - user: tom
    - group: tom
    - require:
      - sls: tom

