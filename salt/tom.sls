include:
  - zsh
  - vim
  - tmux

tom:
  user.present:
    - fullname: Tom Bartlett
    - shell: /bin/zsh
    - home: /home/tom
    - require:
      - sls: zsh
      - sls: vim
      - sls: tmux

/home/tom/.zshrc:
  file:
    - managed
    - source: salt://tom/zshrc
    - owner: tom
    - group: tom
    - mode: 0644 
    - require:
      - sls: zsh
      - user: tom
      - cmd: ohmyzsh

/home/tom/.vimrc:
  file:
    - managed
    - source: salt://tom/vimrc
    - owner: tom
    - group: tom
    - mode: 0644

install_vim_plugins:
  cmd.run:
    - name: vim +PluginInstall +qall
    - onchanges_in:
      - file: /home/tom/.vimrc

ohmyzsh:
  cmd.run: 
    - name: curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh 
    - user: tom
    - require:
      - sls: zsh
      - user: tom

/home/tom/.config:
  file.directory:
    - user: tom
    - group: tom
    - mode: 0755

xfce_config:
  file.recurse:
    - name: /home/tom/.config/xfce
    - user: tom
    - group: tom
    - source: salt://xfce/config
    - require:
      - user: tom
      - file: /home/tom/.config

powerline:
  git.latest:
    - name: https://github.com/powerline/fonts.git
    - target: /tmp/powerline
    - user: tom
    - require:
      - pkg: git
      - user: tom

/tmp/powerline/install.sh:
  cmd.run:
    - user: tom
    - creates: '/home/tom/.local/share/fonts/DejaVu Sans Mono for Powerline.ttf'
    - require:
      - git: powerline

