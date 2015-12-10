apt-transport-https:
  pkg:
    - installed

docker.repo:
  pkgrepo.managed:
    - humandname: Docker
    - name: deb http://apt.dockerproject.org/repo debian-jessie main
    - dist: docker
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: p80.pool.sks-keyservers.net
    - refresh_db: true
    - require:
      - pkg: apt-transport-https

docker.packages:
  pkg.installed:
    - fromrepo: docker
    - pkgs:
      - docker-engine


