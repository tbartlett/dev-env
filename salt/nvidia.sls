/opt/NVIDIA-Linux-x86_64-352.63.run:
  file.managed:
    - source: http://uk.download.nvidia.com/XFree86/Linux-x86_64/352.63/NVIDIA-Linux-x86_64-352.63.run
    - source_hash: md5=d4127834036fe24ec7a07999dadf3529
    - mode: 0744
    - user: root
    - group: root

install_driver:
  cmd.run:
    - name: /opt/NVIDIA-Linux-x86_64-352.63.run --accept-license --update --silent --disable-nouveau --run-nvidia-xconfig 
    - require:
      - file: /opt/NVIDIA-Linux-x86_64-352.63.run
      - cmd: install_headers
      - pkg: install_deps

install_headers:
  cmd.run:
    - name: apt-get install -y linux-headers-$(uname -r)

install_deps:
  pkg.installed:
    - pkgs:
      - gcc

