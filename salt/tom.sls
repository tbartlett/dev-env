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
    - source: salt://zsh/zshrc
    - require:
      - sls: zsh
      - user: tom
      - cmd: ohmyzsh

ohmyzsh:
  cmd.run: 
    - name: curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
    - user: tom
    - require:
      - sls: zsh
      - user: tom 
