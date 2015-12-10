zsh:
  pkg:
    - installed

git:
  pkg:
    - installed


powerline:
  git.latest:
    - name: https://github.com/powerline/fonts.git
    - target: /tmp/powerline
    - require:
      - pkg: git

/tmp/powerline/install.sh:
  cmd.run:
    - require:
      - git: powerline

