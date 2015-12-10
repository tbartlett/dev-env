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
