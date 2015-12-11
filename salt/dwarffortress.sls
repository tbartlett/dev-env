include:
  - tom

# There's a bug in pkg where it can't correctly detect if 32bit packages are installed to 64bit system
df_deps:
  cmd.run:
    - name: apt-get install -y libsdl-image1.2:i386 libsdl-ttf2.0-0:i386 libgtk2.0-0:i386 libjpeg62-turbo:i386 libglu1-mesa:i386 libopenal1:i386
    - require:
      - cmd: arch_32

arch_32:
  cmd.run:
    - name: dpkg --add-architecture i386 && apt-get update

dwarffortress:
  archive.extracted:
    - name: /opt/
    - source: http://www.bay12games.com/dwarves/df_42_02_linux.tar.bz2
    - source_hash: md5=802aaf29810be2fb78120a1171dfbc6d
    - archive_format: tar
    - if_missing: /opt/df_linux/
    - user: tom
    - group: tom
    - require:
      - sls: tom

configure_df:
  cmd.script:
    - name: configure_df
    - source: salt://dwarffortress/configure.sh 
    - require:
      - archive: dwarffortress


